class const TransactionEntry({
  required final String id,
  required final String initial,
  required final String merchant,
  required final String detail,
  required final String dayLabel,
  required final int amount,
  required final bool isIncome,
  required final String source,
  required final bool needsReview,
});
