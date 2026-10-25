import 'package:finarium/src/cards/models/bank_card.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RevealNumberDialog extends StatelessWidget {
  const RevealNumberDialog({super.key, required this.card});

  final BankCard card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(card.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          SelectableText(
            groupCardNumber(card.number),
            style: theme.textTheme.headlineSmall?.copyWith(letterSpacing: 2),
          ),
          Text(
            'Expires ${card.expiry}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      actions: [
        TextButton.icon(
          icon: const Icon(Icons.copy),
          label: const Text('Copy number'),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: card.number));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Card number copied')),
            );
          },
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ],
    );
  }

}
