import 'package:drift/drift.dart';
import 'package:finarium/src/cards/models/bank_card.dart';
import 'package:finarium/src/cards/tables/bank_cards_table.dart';
import 'package:finarium/src/database.dart';
import 'package:flutter/painting.dart' show Color;

part 'cards_dao.g.dart';

@DriftAccessor(tables: [BankCards])
class CardsDao extends DatabaseAccessor<AppDatabase> with _$CardsDaoMixin {
  CardsDao(super.db);

  Stream<List<BankCard>> watchAll() {
    return select(bankCards)
        .watch()
        .map((rows) => rows.map(_cardFromRow).toList());
  }

  Future<void> upsert(BankCard card) {
    return into(bankCards).insertOnConflictUpdate(_cardCompanion(card));
  }

  Future<int> deleteById(String id) {
    return (delete(bankCards)..where((c) => c.id.equals(id))).go();
  }
}

BankCard _cardFromRow(BankCardRow row) {
  return BankCard(
    id: row.id,
    name: row.name,
    network: row.network,
    number: row.number,
    expiry: row.expiry,
    color: Color(row.colorValue),
    creditLimit: row.creditLimit,
    outstanding: row.outstanding,
    spentThisCycle: row.spentThisCycle,
    statementDue: row.statementDue.toUtc(),
    autofillOn: row.autofillOn,
  );
}

BankCardsCompanion _cardCompanion(BankCard card) {
  return BankCardsCompanion(
    id: Value(card.id),
    name: Value(card.name),
    network: Value(card.network),
    number: Value(card.number),
    expiry: Value(card.expiry),
    colorValue: Value(card.color.toARGB32()),
    creditLimit: Value(card.creditLimit),
    outstanding: Value(card.outstanding),
    spentThisCycle: Value(card.spentThisCycle),
    statementDue: Value(card.statementDue),
    autofillOn: Value(card.autofillOn),
  );
}
