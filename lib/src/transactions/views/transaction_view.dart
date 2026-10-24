import 'package:finarium/src/transactions/widgets/budget_overview_card.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BudgetOverviewCard(
            month: 'October',
            spent: 42380,
            budget: 60000,
            progress: 0.71,
            onTrack: true,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(children: [ListTile(title: Text('Netflix'))]),
          ),
        ],
      ),
    );
  }
}
