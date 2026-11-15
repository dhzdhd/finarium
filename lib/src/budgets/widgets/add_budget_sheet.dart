import 'package:finarium/src/budgets/controllers/budget_period_selection.dart';
import 'package:finarium/src/budgets/controllers/budgets_controller.dart';
import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/budgets/models/budget_summary.dart';
import 'package:finarium/src/budgets/widgets/budget_category_colors.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/widgets/add_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' show None, Some;

class AddBudgetSheet extends ConsumerStatefulWidget {
  const AddBudgetSheet({super.key, this.existing});

  final BudgetPlan? existing;

  static Future<void> show(BuildContext context, {BudgetPlan? existing}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => AddBudgetSheet(existing: existing),
    );
  }

  @override
  ConsumerState<AddBudgetSheet> createState() => _AddBudgetSheetState();
}

class _CategoryRow {
  _CategoryRow({
    required this.name,
    required this.color,
    String amount = '',
    String percent = '',
  }) : amount = TextEditingController(text: amount),
       percent = TextEditingController(text: percent);

  final String name;
  final Color color;
  final TextEditingController amount;
  final TextEditingController percent;

  void dispose() {
    amount.dispose();
    percent.dispose();
  }
}

int? _parseRupees(String input) => int.tryParse(input.replaceAll(',', '').trim());

String _percentText(int amount, int total) {
  return total <= 0 ? '' : '${(amount / total * 100).round()}';
}

class _AddBudgetSheetState extends ConsumerState<AddBudgetSheet> {
  late BudgetPeriod _period;
  DateTimeRange? _custom;
  final _total = TextEditingController();
  final _rows = <_CategoryRow>[];
  String? _formError;
  var _saving = false;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    final selection = ref.read(budgetPeriodSelectionProvider);

    _period = existing?.period ?? selection.period;
    _custom = existing == null ? selection.custom : planCustomRange(existing);

    if (existing != null) {
      final total = existing.totalMinor ~/ 100;
      _total.text = '$total';
      for (var i = 0; i < existing.allocations.length; i++) {
        final allocation = existing.allocations[i];
        final amount = allocation.amountMinor ~/ 100;
        _rows.add(
          _CategoryRow(
            name: allocation.category,
            color: budgetCategoryColor(i),
            amount: '$amount',
            percent: _percentText(amount, total),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _total.dispose();
    for (final row in _rows) {
      row.dispose();
    }
    super.dispose();
  }

  int get _totalRupees => _parseRupees(_total.text) ?? 0;

  int get _assignedRupees => _rows.fold(
    0,
    (sum, row) => sum + (_parseRupees(row.amount.text) ?? 0),
  );

  void _onTotalChanged() {
    setState(() {
      for (final row in _rows) {
        row.percent.text = _percentText(
          _parseRupees(row.amount.text) ?? 0,
          _totalRupees,
        );
      }
    });
  }

  void _onAmountChanged(_CategoryRow row) {
    setState(() {
      row.percent.text = _percentText(
        _parseRupees(row.amount.text) ?? 0,
        _totalRupees,
      );
    });
  }

  void _onPercentChanged(_CategoryRow row) {
    setState(() {
      final percent = int.tryParse(row.percent.text.trim()) ?? 0;
      row.amount.text = '${(_totalRupees * percent / 100).round()}';
    });
  }

  Future<DateTimeRange?> _pickRange() {
    final now = DateTime.now();
    return showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
      initialDateRange: _custom,
    );
  }

  Future<void> _onPeriodChanged(Set<BudgetPeriod> selection) async {
    final next = selection.first;
    if (next != BudgetPeriod.custom) {
      setState(() => _period = next);
      return;
    }

    final range = await _pickRange();
    if (range == null || !mounted) return;
    setState(() {
      _period = BudgetPeriod.custom;
      _custom = range;
    });
  }

  Future<void> _addCategory() async {
    final result = await AddCategoryDialog.show(context);
    if (!mounted) return;

    result.match(() {}, (name) {
      final exists = _rows.any(
        (row) => row.name.toLowerCase() == name.toLowerCase(),
      );
      setState(() {
        _formError = exists ? '$name is already in this budget' : null;
        if (!exists) {
          _rows.add(_CategoryRow(name: name, color: budgetCategoryColor(_rows.length)));
        }
      });
    });
  }

  Future<void> _save() async {
    final total = _parseRupees(_total.text);
    final error = switch (total) {
      null || <= 0 => 'Enter a total budget',
      _ when _rows.isEmpty => 'Add at least one category',
      _ when _rows.any((r) => (_parseRupees(r.amount.text) ?? 0) <= 0) =>
        'Every category needs an amount',
      _ when _assignedRupees > total => 'Categories add up to more than the total',
      _ when _period == BudgetPeriod.custom && _custom == null =>
        'Pick a date range',
      _ => null,
    };
    if (error != null) {
      setState(() => _formError = error);
      return;
    }

    final now = DateTime.now();
    final existing = widget.existing;
    final custom = _period == BudgetPeriod.custom ? _custom : null;
    final plan = BudgetPlan(
      id: existing?.id ?? now.microsecondsSinceEpoch.toString(),
      period: _period,
      totalMinor: total! * 100,
      allocations: [
        for (final row in _rows)
          BudgetAllocation(
            category: row.name,
            amountMinor: (_parseRupees(row.amount.text) ?? 0) * 100,
          ),
      ],
      customStart: custom == null ? const None() : Some(custom.start),
      customEnd: custom == null ? const None() : Some(custom.end),
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );

    setState(() {
      _formError = null;
      _saving = true;
    });
    try {
      await ref.read(budgetsControllerProvider.notifier).save(plan);
      if (!mounted) return;
      ref
          .read(budgetPeriodSelectionProvider.notifier)
          .choose(_period, custom: custom);
      Navigator.pop(context);
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save budget')),
      );
    }
  }

  Future<void> _delete() async {
    final id = widget.existing?.id;
    if (id == null) return;
    await ref.read(budgetsControllerProvider.notifier).delete(id);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isEditing = widget.existing != null;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    isEditing ? 'Edit budget' : 'New budget',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SegmentedButton<BudgetPeriod>(
              showSelectedIcon: true,
              segments: [
                for (final period in BudgetPeriod.values)
                  ButtonSegment(value: period, label: Text(period.label)),
              ],
              selected: {_period},
              onSelectionChanged: _onPeriodChanged,
            ),
            TextField(
              controller: _total,
              keyboardType: TextInputType.number,
              style: theme.textTheme.headlineSmall,
              onChanged: (_) => _onTotalChanged(),
              decoration: const InputDecoration(
                labelText: 'Total budget',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
            ),
            _AssignedCard(
              totalRupees: _totalRupees,
              assignedRupees: _assignedRupees,
              segments: [
                for (final row in _rows)
                  (_parseRupees(row.amount.text) ?? 0, row.color),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: [
                Row(
                  children: [
                    Text('Categories', style: theme.textTheme.titleMedium),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Edit amount or percent',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
                for (final row in _rows) _buildRow(row),
                FilledButton.tonalIcon(
                  onPressed: _addCategory,
                  icon: const Icon(Icons.add),
                  label: const Text('Add category'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                    shape: const StadiumBorder(),
                  ),
                ),
              ],
            ),
            if (_formError != null)
              Text(
                _formError!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            Row(
              children: [
                if (isEditing)
                  TextButton(
                    onPressed: _delete,
                    child: Text(
                      'Delete',
                      style: TextStyle(color: colorScheme.error),
                    ),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: FilledButton(
                    onPressed: _saving ? null : _save,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                      shape: const StadiumBorder(),
                    ),
                    child: _saving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save budget'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(_CategoryRow row) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: row.color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            row.name,
            style: theme.textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: 120,
          child: TextField(
            controller: row.amount,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            onChanged: (_) => _onAmountChanged(row),
            decoration: const InputDecoration(
              prefixText: '₹ ',
              isDense: true,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 72,
          child: TextField(
            controller: row.percent,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            onChanged: (_) => _onPercentChanged(row),
            decoration: const InputDecoration(
              suffixText: '%',
              isDense: true,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class _AssignedCard extends StatelessWidget {
  const _AssignedCard({
    required this.totalRupees,
    required this.assignedRupees,
    required this.segments,
  });

  final int totalRupees;
  final int assignedRupees;
  final List<(int, Color)> segments;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final left = totalRupees - assignedRupees;
    final percent = totalRupees <= 0
        ? 0
        : (assignedRupees / totalRupees * 100).round();
    final remaining = left > 0 ? left : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Assigned ${formatInr(assignedRupees)} of ${formatInr(totalRupees)}',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Text(
                '$percent%',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 8,
              child: Row(
                children: [
                  for (final (amount, color) in segments)
                    if (amount > 0)
                      Expanded(
                        flex: amount,
                        child: ColoredBox(color: color),
                      ),
                  if (remaining > 0)
                    Expanded(
                      flex: remaining,
                      child: ColoredBox(
                        color: colorScheme.surfaceContainerHighest,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Text(
            left >= 0
                ? '${formatInr(left)} left to assign'
                : '${formatInr(-left)} over the total',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: left >= 0 ? colorScheme.onSurfaceVariant : colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
