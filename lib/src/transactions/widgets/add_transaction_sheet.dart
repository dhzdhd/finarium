import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TransactionType { expense, income, subscription }

enum SubscriptionFrequency { daily, weekly, monthly, quarterly, yearly }

enum SubscriptionReminder { none, sameDay, oneDay, threeDays, oneWeek }

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
  DateTime? _endDate;
  var _autoRenew = true;
  var _reminder = SubscriptionReminder.oneDay;

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
      .daily => 'Daily',
      .weekly => 'Weekly',
      .monthly => 'Monthly',
      .quarterly => 'Quarterly',
      .yearly => 'Yearly',
    };
  }

  String _reminderLabel(SubscriptionReminder reminder) {
    return switch (reminder) {
      .none => 'No reminder',
      .sameDay => 'On the day',
      .oneDay => '1 day before',
      .threeDays => '3 days before',
      .oneWeek => '1 week before',
    };
  }

  List<Widget> _subscriptionFields() {
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
      const SizedBox(height: 12),
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
          child: Text(
            _formatDate(_date),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      const SizedBox(height: 12),
      InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          final picked = await _pickDate(_endDate ?? _date);
          if (picked != null) setState(() => _endDate = picked);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Ends on (optional)',
            suffixIcon: _endDate == null
                ? const Icon(Icons.calendar_today_outlined)
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => setState(() => _endDate = null),
                  ),
            border: const OutlineInputBorder(),
          ),
          child: Text(
            _endDate == null ? 'Never' : _formatDate(_endDate!),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      const SizedBox(height: 12),
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
            const SizedBox(height: 8),
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
            const SizedBox(height: 16),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: theme.textTheme.headlineSmall,
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Merchant or note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: 'Food & dining',
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Food & dining',
                  child: Text('Food & dining'),
                ),
                DropdownMenuItem(value: 'Travel', child: Text('Travel')),
                DropdownMenuItem(value: 'Shopping', child: Text('Shopping')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: 'Travel card ••4242',
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
              onChanged: (_) {},
            ),
            const SizedBox(height: 12),
            if (_isSubscription)
              ..._subscriptionFields()
            else
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
                  child: Text(
                    _formatDate(_date),
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
            const SizedBox(height: 24),
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
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Save transaction'),
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
