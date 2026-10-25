import 'package:drift/drift.dart';

@DataClassName('BankCardRow')
class BankCards extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get network => text()();
  TextColumn get number => text()();
  TextColumn get expiry => text()();
  IntColumn get colorValue => integer()();
  IntColumn get creditLimit => integer()();
  IntColumn get outstanding => integer()();
  IntColumn get spentThisCycle => integer()();
  DateTimeColumn get statementDue => dateTime()();
  BoolColumn get autofillOn => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
