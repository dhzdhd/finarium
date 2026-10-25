enum TransactionFilter {
  all('All'),
  expenses('Expenses'),
  income('Income'),
  toReview('To review');

  const TransactionFilter(this.label);

  final String label;
}
