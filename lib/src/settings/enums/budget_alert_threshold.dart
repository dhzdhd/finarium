enum BudgetAlertThreshold {
  none('None'),
  fifty('50%'),
  sixty('60%'),
  seventy('70%'),
  eighty('80%'),
  ninety('90%'),
  hundred('100%');

  const BudgetAlertThreshold(this.label);

  final String label;
}
