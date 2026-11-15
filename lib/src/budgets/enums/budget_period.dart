enum BudgetPeriod {
  monthly('Monthly'),
  weekly('Weekly'),
  custom('Custom');

  const BudgetPeriod(this.label);

  final String label;
}
