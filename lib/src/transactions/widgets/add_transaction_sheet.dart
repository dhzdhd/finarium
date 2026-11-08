import 'package:finarium/src/transactions/controllers/transaction_controller.dart';
import 'package:finarium/src/transactions/enums/capture_source.dart';
import 'package:finarium/src/transactions/models/merchant.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:finarium/src/transactions/widgets/add_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

enum TransactionType { expense, income, subscription }

class AddTransactionSheet extends ConsumerStatefulWidget {
  const AddTransactionSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => const AddTransactionSheet(),
    );
  }

  @override
  ConsumerState<AddTransactionSheet> createState() =>
      _AddTransactionSheetState();
}

class _AddTransactionSheetState extends ConsumerState<AddTransactionSheet> {
  var _type = TransactionType.expense;
  var _date = DateTime.now();

  var _frequency = SubscriptionFrequency.monthly;
  var _endDate = Option<DateTime>.none();
  var _autoRenew = true;
  var _reminder = SubscriptionReminder.oneDay;
  final _categories = ['Food & dining', 'Travel', 'Shopping'];
  var _category = 'Food & dining';
  var _paymentSource = 'Travel card ••4242';

  final _amount = TextEditingController();
  final _merchant = TextEditingController();
  String? _amountError;
  var _saving = false;

  @override
  void dispose() {
    _amount.dispose();
    _merchant.dispose();
    super.dispose();
  }

  Future<void> _addCategory() async {
    final result = await AddCategoryDialog.show(context);
    result.match(
      () {},
      (name) => setState(() {
        if (!_categories.contains(name)) _categories.add(name);
        _category = name;
      }),
    );
  }

  int? _parseAmountMinor(String input) {
    final cleaned = input.replaceAll(',', '').trim();
    final parts = cleaned.split('.');
    final rupees = int.tryParse(parts.first);
    if (rupees == null) return null;

    final paise = parts.length > 1
        ? int.tryParse(parts[1].padRight(2, '0').substring(0, 2))
        : 0;
    if (paise == null) return null;

    final minor = rupees * 100 + paise;
    return minor > 0 ? minor : null;
  }

  Future<void> _save() async {
    final amountMinor = _parseAmountMinor(_amount.text);
    if (amountMinor == null) {
      setState(() => _amountError = 'Enter an amount');
      return;
    }

    final now = DateTime.now();
    final id = now.microsecondsSinceEpoch.toString();
    final merchantText = _merchant.text.trim();
    final merchant = merchantText.isEmpty
        ? const Merchant.unknown()
        : Merchant.named(merchantText);

    final transaction = switch (_type) {
      TransactionType.expense => Transaction.expense(
        id: id,
        amountMinor: amountMinor,
        merchant: merchant,
        category: _category,
        paymentSource: _paymentSource,
        captureSource: CaptureSource.manual,
        occurredAt: _date,
        createdAt: now,
        updatedAt: now,
      ),
      TransactionType.income => Transaction.income(
        id: id,
        amountMinor: amountMinor,
        merchant: merchant,
        category: _category,
        paymentSource: _paymentSource,
        captureSource: CaptureSource.manual,
        occurredAt: _date,
        createdAt: now,
        updatedAt: now,
      ),
      TransactionType.subscription => Transaction.subscription(
        id: id,
        amountMinor: amountMinor,
        merchant: merchant,
        category: _category,
        paymentSource: _paymentSource,
        captureSource: CaptureSource.manual,
        occurredAt: _date,
        createdAt: now,
        updatedAt: now,
        firstBillingDate: _date,
        frequency: _frequency,
        endDate: _endDate,
        autoRenew: _autoRenew,
        reminder: _reminder,
      ),
    };

    setState(() => _saving = true);
    try {
      await ref.read(transactionsControllerProvider.notifier).save(transaction);
      if (!mounted) return;
      Navigator.pop(context);
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save transaction')),
      );
    }
  }

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  bool get _isSubscription => _type == TransactionType.subscription;

  Future<DateTime?> _pickDate(DateTime initial) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 25),
      lastDate: DateTime(now.year + 25),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final isToday =
        date.year == now.year && date.month == now.month && date.day == now.day;
    final base = '${date.day} ${_months[date.month - 1]}';
    return isToday ? 'Today, $base' : '$base ${date.year}';
  }

  String _frequencyLabel(SubscriptionFrequency frequency) {
    return switch (frequency) {
      SubscriptionFrequency.daily => 'Daily',
      SubscriptionFrequency.weekly => 'Weekly',
      SubscriptionFrequency.monthly => 'Monthly',
      SubscriptionFrequency.quarterly => 'Quarterly',
      SubscriptionFrequency.yearly => 'Yearly',
    };
  }

  String _reminderLabel(SubscriptionReminder reminder) {
    return switch (reminder) {
      SubscriptionReminder.none => 'No reminder',
      SubscriptionReminder.sameDay => 'On the day',
      SubscriptionReminder.oneDay => '1 day before',
      SubscriptionReminder.threeDays => '3 days before',
      SubscriptionReminder.oneWeek => '1 week before',
    };
  }

  Widget _section(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        ...children,
      ],
    );
  }

  List<Widget> _scheduleFields(BuildContext context) {
    final dateStyle = Theme.of(context).textTheme.titleMedium;

    if (!_isSubscription) {
      return [
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () async {
            final picked = await _pickDate(_date);
            if (picked != null) setState(() => _date = picked);
          },
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Date',
              suffixIcon: Icon(Icons.calendar_today_outlined),
              border: OutlineInputBorder(),
            ),
            child: Text(_formatDate(_date), style: dateStyle),
          ),
        ),
      ];
    }

    return [
      DropdownButtonFormField<SubscriptionFrequency>(
        initialValue: _frequency,
        decoration: const InputDecoration(
          labelText: 'Billing frequency',
          border: OutlineInputBorder(),
        ),
        items: [
          for (final frequency in SubscriptionFrequency.values)
            DropdownMenuItem(
              value: frequency,
              child: Text(_frequencyLabel(frequency)),
            ),
        ],
        onChanged: (value) {
          if (value != null) setState(() => _frequency = value);
        },
      ),
      InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          final picked = await _pickDate(_date);
          if (picked != null) setState(() => _date = picked);
        },
        child: InputDecorator(
          decoration: const InputDecoration(
            labelText: 'First billing date',
            suffixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(),
          ),
          child: Text(_formatDate(_date), style: dateStyle),
        ),
      ),
      InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          final picked = await _pickDate(_endDate.getOrElse(() => _date));
          if (picked != null) setState(() => _endDate = Some(picked));
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Ends on (optional)',
            suffixIcon: switch (_endDate) {
              None() => const Icon(Icons.calendar_today_outlined),
              Some() => IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => setState(() => _endDate = None()),
              ),
            },
            border: const OutlineInputBorder(),
          ),
          child: Text(switch (_endDate) {
            None() => 'Never',
            Some(:final value) => _formatDate(value),
          }, style: dateStyle),
        ),
      ),
      DropdownButtonFormField<SubscriptionReminder>(
        initialValue: _reminder,
        decoration: const InputDecoration(
          labelText: 'Reminder',
          border: OutlineInputBorder(),
        ),
        items: [
          for (final reminder in SubscriptionReminder.values)
            DropdownMenuItem(
              value: reminder,
              child: Text(_reminderLabel(reminder)),
            ),
        ],
        onChanged: (value) {
          if (value != null) setState(() => _reminder = value);
        },
      ),
      SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Auto-renew'),
        subtitle: const Text('Automatically record each charge'),
        value: _autoRenew,
        onChanged: (value) => setState(() => _autoRenew = value),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                    'Add transaction',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SegmentedButton<TransactionType>(
              showSelectedIcon: true,
              segments: const [
                ButtonSegment(
                  value: TransactionType.expense,
                  label: Text('Expense'),
                ),
                ButtonSegment(
                  value: TransactionType.income,
                  label: Text('Income'),
                ),
                ButtonSegment(
                  value: TransactionType.subscription,
                  label: Text('Subscription'),
                ),
              ],
              selected: {_type},
              onSelectionChanged: (selection) {
                setState(() => _type = selection.first);
              },
            ),
            _section(context, 'Details', [
              TextField(
                controller: _amount,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: theme.textTheme.headlineSmall,
                onChanged: (_) {
                  if (_amountError != null) {
                    setState(() => _amountError = null);
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                  prefixText: '₹ ',
                  errorText: _amountError,
                  border: const OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _merchant,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Merchant or note',
                  border: OutlineInputBorder(),
                ),
              ),
            ]),
            _section(context, 'Category & payment', [
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      key: ValueKey(_category),
                      initialValue: _category,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        for (final category in _categories)
                          DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                      ],
                      onChanged: (value) {
                        if (value != null) setState(() => _category = value);
                      },
                    ),
                  ),
                  IconButton.filledTonal(
                    tooltip: 'Add category',
                    onPressed: _addCategory,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                initialValue: _paymentSource,
                decoration: const InputDecoration(
                  labelText: 'Paid from',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Travel card ••4242',
                    child: Text('Travel card ••4242'),
                  ),
                  DropdownMenuItem(
                    value: 'Savings ••1108',
                    child: Text('Savings ••1108'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _paymentSource = value);
                },
              ),
            ]),
            _section(context, 'Schedule', _scheduleFields(context)),
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
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
                        : const Text('Save transaction'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
