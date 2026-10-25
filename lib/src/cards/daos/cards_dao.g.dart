// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_dao.dart';

// ignore_for_file: type=lint
mixin _$CardsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BankCardsTable get bankCards => attachedDatabase.bankCards;
  CardsDaoManager get managers => CardsDaoManager(this);
}

class CardsDaoManager {
  final _$CardsDaoMixin _db;
  CardsDaoManager(this._db);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db.attachedDatabase, _db.bankCards);
}
