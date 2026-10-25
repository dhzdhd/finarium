import 'package:finarium/src/cards/models/bank_card.dart';
import 'package:flutter/material.dart';

class EditCardDialog extends StatefulWidget {
  const EditCardDialog({super.key, required this.card});

  final BankCard card;

  @override
  State<EditCardDialog> createState() => _EditCardDialogState();
}

class _EditCardDialogState extends State<EditCardDialog> {
  late final _name = TextEditingController(text: widget.card.name);
  late final _creditLimit = TextEditingController(
    text: widget.card.creditLimit.toString(),
  );
  late final _expiry = TextEditingController(text: widget.card.expiry);

  @override
  void dispose() {
    _name.dispose();
    _creditLimit.dispose();
    _expiry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit card details'),
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
            controller: _creditLimit,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Credit limit',
              prefixText: '₹ ',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _expiry,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              labelText: 'Expiry (MM/YY)',
              border: OutlineInputBorder(),
            ),
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
          child: const Text('Save'),
        ),
      ],
    );
  }
}
