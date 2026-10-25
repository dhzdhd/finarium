enum AutoLockDuration {
  immediately('Immediately'),
  thirtySeconds('After 30 sec'),
  oneMinute('After 1 min'),
  fiveMinutes('After 5 min'),
  fifteenMinutes('After 15 min'),
  thirtyMinutes('After 30 min'),
  oneHour('After 1 hour'),
  never('Never');

  const AutoLockDuration(this.label);

  final String label;
}
