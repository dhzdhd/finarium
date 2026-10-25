import 'package:finarium/src/cards/models/bank_card.dart';
import 'package:flutter/material.dart';

class BankCardTile extends StatelessWidget {
  const BankCardTile({super.key, required this.card});

  final BankCard card;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = Colors.white;
    final percent = (card.limitUsed * 100).round();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  card.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                card.network,
                style: theme.textTheme.titleMedium?.copyWith(color: textColor),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '•••• •••• •••• ${card.last4}',
            style: theme.textTheme.titleLarge?.copyWith(
              color: textColor,
              letterSpacing: 2,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Expires ${card.expiry}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: textColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$percent% of limit used',
                maxLines: 1,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textColor.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: card.limitUsed.clamp(0.0, 1.0),
              minHeight: 6,
              color: textColor,
              backgroundColor: textColor.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}
