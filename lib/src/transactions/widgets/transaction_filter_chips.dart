import 'package:finarium/src/transactions/enums/transaction_filter.dart';
import 'package:flutter/material.dart';

class TransactionFilterChips extends StatelessWidget {
  const TransactionFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final TransactionFilter selected;
  final ValueChanged<TransactionFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: [
                for (final filter in TransactionFilter.values)
                  FilterChip(
                    label: Text(filter.label),
                    selected: filter == selected,
                    showCheckmark: true,
                    onSelected: (_) => onSelected(filter),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
