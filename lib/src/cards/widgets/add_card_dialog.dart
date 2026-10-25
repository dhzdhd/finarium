import 'package:finarium/src/core/formatters.dart';
import 'package:flutter/material.dart';

class AddCardDialog extends StatefulWidget {
  const AddCardDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const AddCardDialog(),
    );
  }

  @override
  State<AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final _name = TextEditingController();
  final _number = TextEditingController();
  final _expiry = TextEditingController();
  final _creditLimit = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _number.dispose();
    _expiry.dispose();
    _creditLimit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add card'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              labelText: 'Card name',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _number,
            keyboardType: TextInputType.number,
            inputFormatters: const [CardNumberInputFormatter()],
            decoration: const InputDecoration(
              labelText: 'Card number',
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: TextField(
                  controller: _expiry,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Expiry (MM/YY)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _creditLimit,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Credit limit',
                    prefixText: '₹ ',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Save card'),
        ),
      ],
    );
  }
}
