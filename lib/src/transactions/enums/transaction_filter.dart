enum TransactionFilter {
  all('All'),
  expenses('Expenses'),
  income('Income'),
  subscriptions('Subscriptions'),
  toReview('To review');

  const TransactionFilter(this.label);

  final String label;
}
