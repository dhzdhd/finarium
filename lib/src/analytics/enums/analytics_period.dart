enum AnalyticsPeriod {
  thisMonth('This month'),
  threeMonths('3 months'),
  sixMonths('6 months'),
  year('Year');

  const AnalyticsPeriod(this.label);

  final String label;
}
