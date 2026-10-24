// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
Transaction _$TransactionFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'expense':
          return ExpenseTransaction.fromJson(
            json
          );
                case 'income':
          return IncomeTransaction.fromJson(
            json
          );
                case 'subscription':
          return SubscriptionTransaction.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Transaction',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Transaction {

 String get id; int get amountMinor; String get merchant; String get category; String get paymentSource; DateTime get occurredAt; DateTime get createdAt; DateTime get updatedAt; String get currency;@OptionStringConverter() Option<String> get note;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Transaction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.amountMinor, _this.amountMinor) || other.amountMinor == _this.amountMinor)&&(identical(other.merchant, _this.merchant) || other.merchant == _this.merchant)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.paymentSource, _this.paymentSource) || other.paymentSource == _this.paymentSource)&&(identical(other.occurredAt, _this.occurredAt) || other.occurredAt == _this.occurredAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Transaction;
  return Object.hash(runtimeType,_this.id,_this.amountMinor,_this.merchant,_this.category,_this.paymentSource,_this.occurredAt,_this.createdAt,_this.updatedAt,_this.currency,_this.note);
}

@override
String toString() {
  final _this = this as Transaction;
  return 'Transaction(id: ${_this.id}, amountMinor: ${_this.amountMinor}, merchant: ${_this.merchant}, category: ${_this.category}, paymentSource: ${_this.paymentSource}, occurredAt: ${_this.occurredAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, currency: ${_this.currency}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String id, int amountMinor, String merchant, String category, String paymentSource, DateTime occurredAt, DateTime createdAt, DateTime updatedAt, String currency,@OptionStringConverter() Option<String> note
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountMinor = null,Object? merchant = null,Object? category = null,Object? paymentSource = null,Object? occurredAt = null,Object? createdAt = null,Object? updatedAt = null,Object? currency = null,Object? note = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,paymentSource: null == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpenseTransaction value)?  expense,TResult Function( IncomeTransaction value)?  income,TResult Function( SubscriptionTransaction value)?  subscription,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpenseTransaction() when expense != null:
return expense(_that);case IncomeTransaction() when income != null:
return income(_that);case SubscriptionTransaction() when subscription != null:
return subscription(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpenseTransaction value)  expense,required TResult Function( IncomeTransaction value)  income,required TResult Function( SubscriptionTransaction value)  subscription,}){
final _that = this;
switch (_that) {
case ExpenseTransaction():
return expense(_that);case IncomeTransaction():
return income(_that);case SubscriptionTransaction():
return subscription(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpenseTransaction value)?  expense,TResult? Function( IncomeTransaction value)?  income,TResult? Function( SubscriptionTransaction value)?  subscription,}){
final _that = this;
switch (_that) {
case ExpenseTransaction() when expense != null:
return expense(_that);case IncomeTransaction() when income != null:
return income(_that);case SubscriptionTransaction() when subscription != null:
return subscription(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note, @OptionStringConverter()  Option<String> receiptPath)?  expense,TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note,  bool isRecurring)?  income,TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  DateTime firstBillingDate,  SubscriptionFrequency frequency,  String currency, @OptionDateTimeConverter()  Option<DateTime> endDate, @OptionStringConverter()  Option<String> note,  bool autoRenew,  SubscriptionReminder reminder)?  subscription,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpenseTransaction() when expense != null:
return expense(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.receiptPath);case IncomeTransaction() when income != null:
return income(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.isRecurring);case SubscriptionTransaction() when subscription != null:
return subscription(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.firstBillingDate,_that.frequency,_that.currency,_that.endDate,_that.note,_that.autoRenew,_that.reminder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note, @OptionStringConverter()  Option<String> receiptPath)  expense,required TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note,  bool isRecurring)  income,required TResult Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  DateTime firstBillingDate,  SubscriptionFrequency frequency,  String currency, @OptionDateTimeConverter()  Option<DateTime> endDate, @OptionStringConverter()  Option<String> note,  bool autoRenew,  SubscriptionReminder reminder)  subscription,}) {final _that = this;
switch (_that) {
case ExpenseTransaction():
return expense(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.receiptPath);case IncomeTransaction():
return income(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.isRecurring);case SubscriptionTransaction():
return subscription(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.firstBillingDate,_that.frequency,_that.currency,_that.endDate,_that.note,_that.autoRenew,_that.reminder);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note, @OptionStringConverter()  Option<String> receiptPath)?  expense,TResult? Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  String currency, @OptionStringConverter()  Option<String> note,  bool isRecurring)?  income,TResult? Function( String id,  int amountMinor,  String merchant,  String category,  String paymentSource,  DateTime occurredAt,  DateTime createdAt,  DateTime updatedAt,  DateTime firstBillingDate,  SubscriptionFrequency frequency,  String currency, @OptionDateTimeConverter()  Option<DateTime> endDate, @OptionStringConverter()  Option<String> note,  bool autoRenew,  SubscriptionReminder reminder)?  subscription,}) {final _that = this;
switch (_that) {
case ExpenseTransaction() when expense != null:
return expense(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.receiptPath);case IncomeTransaction() when income != null:
return income(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.currency,_that.note,_that.isRecurring);case SubscriptionTransaction() when subscription != null:
return subscription(_that.id,_that.amountMinor,_that.merchant,_that.category,_that.paymentSource,_that.occurredAt,_that.createdAt,_that.updatedAt,_that.firstBillingDate,_that.frequency,_that.currency,_that.endDate,_that.note,_that.autoRenew,_that.reminder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ExpenseTransaction implements Transaction {
  const ExpenseTransaction({required this.id, required this.amountMinor, required this.merchant, required this.category, required this.paymentSource, required this.occurredAt, required this.createdAt, required this.updatedAt, this.currency = 'INR', @OptionStringConverter() this.note = const None(), @OptionStringConverter() this.receiptPath = const None(),  String? $type}): $type = $type ?? 'expense';
  factory ExpenseTransaction.fromJson(Map<String, dynamic> json) => _$ExpenseTransactionFromJson(json);

@override final  String id;
@override final  int amountMinor;
@override final  String merchant;
@override final  String category;
@override final  String paymentSource;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  String currency;
@override@JsonKey()@OptionStringConverter() final  Option<String> note;
@JsonKey()@OptionStringConverter() final  Option<String> receiptPath;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseTransactionCopyWith<ExpenseTransaction> get copyWith => _$ExpenseTransactionCopyWithImpl<ExpenseTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.category, category) || other.category == category)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.note, note) || other.note == note)&&(identical(other.receiptPath, receiptPath) || other.receiptPath == receiptPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,amountMinor,merchant,category,paymentSource,occurredAt,createdAt,updatedAt,currency,note,receiptPath);
}

@override
String toString() {
    return 'Transaction.expense(id: $id, amountMinor: $amountMinor, merchant: $merchant, category: $category, paymentSource: $paymentSource, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency, note: $note, receiptPath: $receiptPath)';
}


}

/// @nodoc
abstract mixin class $ExpenseTransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $ExpenseTransactionCopyWith(ExpenseTransaction value, $Res Function(ExpenseTransaction) _then) = _$ExpenseTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountMinor, String merchant, String category, String paymentSource, DateTime occurredAt, DateTime createdAt, DateTime updatedAt, String currency,@OptionStringConverter() Option<String> note,@OptionStringConverter() Option<String> receiptPath
});




}
/// @nodoc
class _$ExpenseTransactionCopyWithImpl<$Res>
    implements $ExpenseTransactionCopyWith<$Res> {
  _$ExpenseTransactionCopyWithImpl(this._self, this._then);

  final ExpenseTransaction _self;
  final $Res Function(ExpenseTransaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? merchant = null,Object? category = null,Object? paymentSource = null,Object? occurredAt = null,Object? createdAt = null,Object? updatedAt = null,Object? currency = null,Object? note = null,Object? receiptPath = null,}) {
  return _then(ExpenseTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,paymentSource: null == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Option<String>,receiptPath: null == receiptPath ? _self.receiptPath : receiptPath // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class IncomeTransaction implements Transaction {
  const IncomeTransaction({required this.id, required this.amountMinor, required this.merchant, required this.category, required this.paymentSource, required this.occurredAt, required this.createdAt, required this.updatedAt, this.currency = 'INR', @OptionStringConverter() this.note = const None(), this.isRecurring = false,  String? $type}): $type = $type ?? 'income';
  factory IncomeTransaction.fromJson(Map<String, dynamic> json) => _$IncomeTransactionFromJson(json);

@override final  String id;
@override final  int amountMinor;
@override final  String merchant;
@override final  String category;
@override final  String paymentSource;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  String currency;
@override@JsonKey()@OptionStringConverter() final  Option<String> note;
@JsonKey() final  bool isRecurring;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeTransactionCopyWith<IncomeTransaction> get copyWith => _$IncomeTransactionCopyWithImpl<IncomeTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.category, category) || other.category == category)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.note, note) || other.note == note)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,amountMinor,merchant,category,paymentSource,occurredAt,createdAt,updatedAt,currency,note,isRecurring);
}

@override
String toString() {
    return 'Transaction.income(id: $id, amountMinor: $amountMinor, merchant: $merchant, category: $category, paymentSource: $paymentSource, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency, note: $note, isRecurring: $isRecurring)';
}


}

/// @nodoc
abstract mixin class $IncomeTransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $IncomeTransactionCopyWith(IncomeTransaction value, $Res Function(IncomeTransaction) _then) = _$IncomeTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountMinor, String merchant, String category, String paymentSource, DateTime occurredAt, DateTime createdAt, DateTime updatedAt, String currency,@OptionStringConverter() Option<String> note, bool isRecurring
});




}
/// @nodoc
class _$IncomeTransactionCopyWithImpl<$Res>
    implements $IncomeTransactionCopyWith<$Res> {
  _$IncomeTransactionCopyWithImpl(this._self, this._then);

  final IncomeTransaction _self;
  final $Res Function(IncomeTransaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? merchant = null,Object? category = null,Object? paymentSource = null,Object? occurredAt = null,Object? createdAt = null,Object? updatedAt = null,Object? currency = null,Object? note = null,Object? isRecurring = null,}) {
  return _then(IncomeTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,paymentSource: null == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Option<String>,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SubscriptionTransaction implements Transaction {
  const SubscriptionTransaction({required this.id, required this.amountMinor, required this.merchant, required this.category, required this.paymentSource, required this.occurredAt, required this.createdAt, required this.updatedAt, required this.firstBillingDate, required this.frequency, this.currency = 'INR', @OptionDateTimeConverter() this.endDate = const None(), @OptionStringConverter() this.note = const None(), this.autoRenew = true, this.reminder = SubscriptionReminder.oneDay,  String? $type}): $type = $type ?? 'subscription';
  factory SubscriptionTransaction.fromJson(Map<String, dynamic> json) => _$SubscriptionTransactionFromJson(json);

@override final  String id;
@override final  int amountMinor;
@override final  String merchant;
@override final  String category;
@override final  String paymentSource;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  DateTime firstBillingDate;
 final  SubscriptionFrequency frequency;
@override@JsonKey() final  String currency;
@JsonKey()@OptionDateTimeConverter() final  Option<DateTime> endDate;
@override@JsonKey()@OptionStringConverter() final  Option<String> note;
@JsonKey() final  bool autoRenew;
@JsonKey() final  SubscriptionReminder reminder;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionTransactionCopyWith<SubscriptionTransaction> get copyWith => _$SubscriptionTransactionCopyWithImpl<SubscriptionTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.category, category) || other.category == category)&&(identical(other.paymentSource, paymentSource) || other.paymentSource == paymentSource)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.firstBillingDate, firstBillingDate) || other.firstBillingDate == firstBillingDate)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.autoRenew, autoRenew) || other.autoRenew == autoRenew)&&(identical(other.reminder, reminder) || other.reminder == reminder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,amountMinor,merchant,category,paymentSource,occurredAt,createdAt,updatedAt,firstBillingDate,frequency,currency,endDate,note,autoRenew,reminder);
}

@override
String toString() {
    return 'Transaction.subscription(id: $id, amountMinor: $amountMinor, merchant: $merchant, category: $category, paymentSource: $paymentSource, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, firstBillingDate: $firstBillingDate, frequency: $frequency, currency: $currency, endDate: $endDate, note: $note, autoRenew: $autoRenew, reminder: $reminder)';
}


}

/// @nodoc
abstract mixin class $SubscriptionTransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $SubscriptionTransactionCopyWith(SubscriptionTransaction value, $Res Function(SubscriptionTransaction) _then) = _$SubscriptionTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountMinor, String merchant, String category, String paymentSource, DateTime occurredAt, DateTime createdAt, DateTime updatedAt, DateTime firstBillingDate, SubscriptionFrequency frequency, String currency,@OptionDateTimeConverter() Option<DateTime> endDate,@OptionStringConverter() Option<String> note, bool autoRenew, SubscriptionReminder reminder
});




}
/// @nodoc
class _$SubscriptionTransactionCopyWithImpl<$Res>
    implements $SubscriptionTransactionCopyWith<$Res> {
  _$SubscriptionTransactionCopyWithImpl(this._self, this._then);

  final SubscriptionTransaction _self;
  final $Res Function(SubscriptionTransaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? merchant = null,Object? category = null,Object? paymentSource = null,Object? occurredAt = null,Object? createdAt = null,Object? updatedAt = null,Object? firstBillingDate = null,Object? frequency = null,Object? currency = null,Object? endDate = null,Object? note = null,Object? autoRenew = null,Object? reminder = null,}) {
  return _then(SubscriptionTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,paymentSource: null == paymentSource ? _self.paymentSource : paymentSource // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,firstBillingDate: null == firstBillingDate ? _self.firstBillingDate : firstBillingDate // ignore: cast_nullable_to_non_nullable
as DateTime,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as SubscriptionFrequency,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Option<String>,autoRenew: null == autoRenew ? _self.autoRenew : autoRenew // ignore: cast_nullable_to_non_nullable
as bool,reminder: null == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as SubscriptionReminder,
  ));
}


}

// dart format on
