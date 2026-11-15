import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';

class BudgetAllocationsConverter
    extends TypeConverter<List<BudgetAllocation>, String> {
  const BudgetAllocationsConverter();

  @override
  List<BudgetAllocation> fromSql(String fromDb) {
    final list = jsonDecode(fromDb) as List<dynamic>;
    return [
      for (final item in list)
        BudgetAllocation.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  String toSql(List<BudgetAllocation> value) {
    return jsonEncode([for (final allocation in value) allocation.toJson()]);
  }
}

@DataClassName('BudgetPlanRow')
class BudgetPlans extends Table {
  TextColumn get id => text()();
  TextColumn get period => textEnum<BudgetPeriod>()();
  IntColumn get totalMinor => integer()();
  DateTimeColumn get customStart => dateTime().nullable()();
  DateTimeColumn get customEnd => dateTime().nullable()();
  TextColumn get allocations =>
      text().map(const BudgetAllocationsConverter())();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
