// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionKind>($TransactionsTable.$converterkind);
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _merchantNameMeta = const VerificationMeta(
    'merchantName',
  );
  @override
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
    'merchant_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentSourceMeta = const VerificationMeta(
    'paymentSource',
  );
  @override
  late final GeneratedColumn<String> paymentSource = GeneratedColumn<String>(
    'payment_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CaptureSource, String>
  captureSource = GeneratedColumn<String>(
    'capture_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<CaptureSource>($TransactionsTable.$convertercaptureSource);
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INR'),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptPathMeta = const VerificationMeta(
    'receiptPath',
  );
  @override
  late final GeneratedColumn<String> receiptPath = GeneratedColumn<String>(
    'receipt_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isRecurringMeta = const VerificationMeta(
    'isRecurring',
  );
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
    'is_recurring',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_recurring" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _firstBillingDateMeta = const VerificationMeta(
    'firstBillingDate',
  );
  @override
  late final GeneratedColumn<DateTime> firstBillingDate =
      GeneratedColumn<DateTime>(
        'first_billing_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final GeneratedColumnWithTypeConverter<SubscriptionFrequency?, String>
  frequency =
      GeneratedColumn<String>(
        'frequency',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SubscriptionFrequency?>(
        $TransactionsTable.$converterfrequencyn,
      );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _autoRenewMeta = const VerificationMeta(
    'autoRenew',
  );
  @override
  late final GeneratedColumn<bool> autoRenew = GeneratedColumn<bool>(
    'auto_renew',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("auto_renew" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SubscriptionReminder?, String>
  reminder =
      GeneratedColumn<String>(
        'reminder',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SubscriptionReminder?>(
        $TransactionsTable.$converterremindern,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    amountMinor,
    merchantName,
    category,
    paymentSource,
    captureSource,
    occurredAt,
    createdAt,
    updatedAt,
    currency,
    note,
    receiptPath,
    isRecurring,
    firstBillingDate,
    frequency,
    endDate,
    autoRenew,
    reminder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
        _merchantNameMeta,
        merchantName.isAcceptableOrUnknown(
          data['merchant_name']!,
          _merchantNameMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('payment_source')) {
      context.handle(
        _paymentSourceMeta,
        paymentSource.isAcceptableOrUnknown(
          data['payment_source']!,
          _paymentSourceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentSourceMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('receipt_path')) {
      context.handle(
        _receiptPathMeta,
        receiptPath.isAcceptableOrUnknown(
          data['receipt_path']!,
          _receiptPathMeta,
        ),
      );
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
        _isRecurringMeta,
        isRecurring.isAcceptableOrUnknown(
          data['is_recurring']!,
          _isRecurringMeta,
        ),
      );
    }
    if (data.containsKey('first_billing_date')) {
      context.handle(
        _firstBillingDateMeta,
        firstBillingDate.isAcceptableOrUnknown(
          data['first_billing_date']!,
          _firstBillingDateMeta,
        ),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('auto_renew')) {
      context.handle(
        _autoRenewMeta,
        autoRenew.isAcceptableOrUnknown(data['auto_renew']!, _autoRenewMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: $TransactionsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      merchantName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant_name'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      paymentSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_source'],
      )!,
      captureSource: $TransactionsTable.$convertercaptureSource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}capture_source'],
        )!,
      ),
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      receiptPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_path'],
      ),
      isRecurring: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_recurring'],
      )!,
      firstBillingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}first_billing_date'],
      ),
      frequency: $TransactionsTable.$converterfrequencyn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}frequency'],
        ),
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      autoRenew: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}auto_renew'],
      )!,
      reminder: $TransactionsTable.$converterremindern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reminder'],
        ),
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionKind, String, String> $converterkind =
      const EnumNameConverter<TransactionKind>(TransactionKind.values);
  static JsonTypeConverter2<CaptureSource, String, String>
  $convertercaptureSource = const EnumNameConverter<CaptureSource>(
    CaptureSource.values,
  );
  static JsonTypeConverter2<SubscriptionFrequency, String, String>
  $converterfrequency = const EnumNameConverter<SubscriptionFrequency>(
    SubscriptionFrequency.values,
  );
  static JsonTypeConverter2<SubscriptionFrequency?, String?, String?>
  $converterfrequencyn = JsonTypeConverter2.asNullable($converterfrequency);
  static JsonTypeConverter2<SubscriptionReminder, String, String>
  $converterreminder = const EnumNameConverter<SubscriptionReminder>(
    SubscriptionReminder.values,
  );
  static JsonTypeConverter2<SubscriptionReminder?, String?, String?>
  $converterremindern = JsonTypeConverter2.asNullable($converterreminder);
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final String id;
  final TransactionKind kind;
  final int amountMinor;
  final String? merchantName;
  final String category;
  final String paymentSource;
  final CaptureSource captureSource;
  final DateTime occurredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String currency;
  final String? note;
  final String? receiptPath;
  final bool isRecurring;
  final DateTime? firstBillingDate;
  final SubscriptionFrequency? frequency;
  final DateTime? endDate;
  final bool autoRenew;
  final SubscriptionReminder? reminder;
  const TransactionRow({
    required this.id,
    required this.kind,
    required this.amountMinor,
    this.merchantName,
    required this.category,
    required this.paymentSource,
    required this.captureSource,
    required this.occurredAt,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
    this.note,
    this.receiptPath,
    required this.isRecurring,
    this.firstBillingDate,
    this.frequency,
    this.endDate,
    required this.autoRenew,
    this.reminder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['kind'] = Variable<String>(
        $TransactionsTable.$converterkind.toSql(kind),
      );
    }
    map['amount_minor'] = Variable<int>(amountMinor);
    if (!nullToAbsent || merchantName != null) {
      map['merchant_name'] = Variable<String>(merchantName);
    }
    map['category'] = Variable<String>(category);
    map['payment_source'] = Variable<String>(paymentSource);
    {
      map['capture_source'] = Variable<String>(
        $TransactionsTable.$convertercaptureSource.toSql(captureSource),
      );
    }
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || receiptPath != null) {
      map['receipt_path'] = Variable<String>(receiptPath);
    }
    map['is_recurring'] = Variable<bool>(isRecurring);
    if (!nullToAbsent || firstBillingDate != null) {
      map['first_billing_date'] = Variable<DateTime>(firstBillingDate);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<String>(
        $TransactionsTable.$converterfrequencyn.toSql(frequency),
      );
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['auto_renew'] = Variable<bool>(autoRenew);
    if (!nullToAbsent || reminder != null) {
      map['reminder'] = Variable<String>(
        $TransactionsTable.$converterremindern.toSql(reminder),
      );
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      kind: Value(kind),
      amountMinor: Value(amountMinor),
      merchantName: merchantName == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantName),
      category: Value(category),
      paymentSource: Value(paymentSource),
      captureSource: Value(captureSource),
      occurredAt: Value(occurredAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      currency: Value(currency),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      receiptPath: receiptPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPath),
      isRecurring: Value(isRecurring),
      firstBillingDate: firstBillingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(firstBillingDate),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      autoRenew: Value(autoRenew),
      reminder: reminder == null && nullToAbsent
          ? const Value.absent()
          : Value(reminder),
    );
  }

  factory TransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<String>(json['id']),
      kind: $TransactionsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      merchantName: serializer.fromJson<String?>(json['merchantName']),
      category: serializer.fromJson<String>(json['category']),
      paymentSource: serializer.fromJson<String>(json['paymentSource']),
      captureSource: $TransactionsTable.$convertercaptureSource.fromJson(
        serializer.fromJson<String>(json['captureSource']),
      ),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      currency: serializer.fromJson<String>(json['currency']),
      note: serializer.fromJson<String?>(json['note']),
      receiptPath: serializer.fromJson<String?>(json['receiptPath']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      firstBillingDate: serializer.fromJson<DateTime?>(
        json['firstBillingDate'],
      ),
      frequency: $TransactionsTable.$converterfrequencyn.fromJson(
        serializer.fromJson<String?>(json['frequency']),
      ),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      autoRenew: serializer.fromJson<bool>(json['autoRenew']),
      reminder: $TransactionsTable.$converterremindern.fromJson(
        serializer.fromJson<String?>(json['reminder']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(
        $TransactionsTable.$converterkind.toJson(kind),
      ),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'merchantName': serializer.toJson<String?>(merchantName),
      'category': serializer.toJson<String>(category),
      'paymentSource': serializer.toJson<String>(paymentSource),
      'captureSource': serializer.toJson<String>(
        $TransactionsTable.$convertercaptureSource.toJson(captureSource),
      ),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'currency': serializer.toJson<String>(currency),
      'note': serializer.toJson<String?>(note),
      'receiptPath': serializer.toJson<String?>(receiptPath),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'firstBillingDate': serializer.toJson<DateTime?>(firstBillingDate),
      'frequency': serializer.toJson<String?>(
        $TransactionsTable.$converterfrequencyn.toJson(frequency),
      ),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'autoRenew': serializer.toJson<bool>(autoRenew),
      'reminder': serializer.toJson<String?>(
        $TransactionsTable.$converterremindern.toJson(reminder),
      ),
    };
  }

  TransactionRow copyWith({
    String? id,
    TransactionKind? kind,
    int? amountMinor,
    Value<String?> merchantName = const Value.absent(),
    String? category,
    String? paymentSource,
    CaptureSource? captureSource,
    DateTime? occurredAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? currency,
    Value<String?> note = const Value.absent(),
    Value<String?> receiptPath = const Value.absent(),
    bool? isRecurring,
    Value<DateTime?> firstBillingDate = const Value.absent(),
    Value<SubscriptionFrequency?> frequency = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    bool? autoRenew,
    Value<SubscriptionReminder?> reminder = const Value.absent(),
  }) => TransactionRow(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    amountMinor: amountMinor ?? this.amountMinor,
    merchantName: merchantName.present ? merchantName.value : this.merchantName,
    category: category ?? this.category,
    paymentSource: paymentSource ?? this.paymentSource,
    captureSource: captureSource ?? this.captureSource,
    occurredAt: occurredAt ?? this.occurredAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    currency: currency ?? this.currency,
    note: note.present ? note.value : this.note,
    receiptPath: receiptPath.present ? receiptPath.value : this.receiptPath,
    isRecurring: isRecurring ?? this.isRecurring,
    firstBillingDate: firstBillingDate.present
        ? firstBillingDate.value
        : this.firstBillingDate,
    frequency: frequency.present ? frequency.value : this.frequency,
    endDate: endDate.present ? endDate.value : this.endDate,
    autoRenew: autoRenew ?? this.autoRenew,
    reminder: reminder.present ? reminder.value : this.reminder,
  );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      merchantName: data.merchantName.present
          ? data.merchantName.value
          : this.merchantName,
      category: data.category.present ? data.category.value : this.category,
      paymentSource: data.paymentSource.present
          ? data.paymentSource.value
          : this.paymentSource,
      captureSource: data.captureSource.present
          ? data.captureSource.value
          : this.captureSource,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      currency: data.currency.present ? data.currency.value : this.currency,
      note: data.note.present ? data.note.value : this.note,
      receiptPath: data.receiptPath.present
          ? data.receiptPath.value
          : this.receiptPath,
      isRecurring: data.isRecurring.present
          ? data.isRecurring.value
          : this.isRecurring,
      firstBillingDate: data.firstBillingDate.present
          ? data.firstBillingDate.value
          : this.firstBillingDate,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      autoRenew: data.autoRenew.present ? data.autoRenew.value : this.autoRenew,
      reminder: data.reminder.present ? data.reminder.value : this.reminder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('merchantName: $merchantName, ')
          ..write('category: $category, ')
          ..write('paymentSource: $paymentSource, ')
          ..write('captureSource: $captureSource, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currency: $currency, ')
          ..write('note: $note, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('firstBillingDate: $firstBillingDate, ')
          ..write('frequency: $frequency, ')
          ..write('endDate: $endDate, ')
          ..write('autoRenew: $autoRenew, ')
          ..write('reminder: $reminder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kind,
    amountMinor,
    merchantName,
    category,
    paymentSource,
    captureSource,
    occurredAt,
    createdAt,
    updatedAt,
    currency,
    note,
    receiptPath,
    isRecurring,
    firstBillingDate,
    frequency,
    endDate,
    autoRenew,
    reminder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.amountMinor == this.amountMinor &&
          other.merchantName == this.merchantName &&
          other.category == this.category &&
          other.paymentSource == this.paymentSource &&
          other.captureSource == this.captureSource &&
          other.occurredAt == this.occurredAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.currency == this.currency &&
          other.note == this.note &&
          other.receiptPath == this.receiptPath &&
          other.isRecurring == this.isRecurring &&
          other.firstBillingDate == this.firstBillingDate &&
          other.frequency == this.frequency &&
          other.endDate == this.endDate &&
          other.autoRenew == this.autoRenew &&
          other.reminder == this.reminder);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<String> id;
  final Value<TransactionKind> kind;
  final Value<int> amountMinor;
  final Value<String?> merchantName;
  final Value<String> category;
  final Value<String> paymentSource;
  final Value<CaptureSource> captureSource;
  final Value<DateTime> occurredAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> currency;
  final Value<String?> note;
  final Value<String?> receiptPath;
  final Value<bool> isRecurring;
  final Value<DateTime?> firstBillingDate;
  final Value<SubscriptionFrequency?> frequency;
  final Value<DateTime?> endDate;
  final Value<bool> autoRenew;
  final Value<SubscriptionReminder?> reminder;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.category = const Value.absent(),
    this.paymentSource = const Value.absent(),
    this.captureSource = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.currency = const Value.absent(),
    this.note = const Value.absent(),
    this.receiptPath = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.firstBillingDate = const Value.absent(),
    this.frequency = const Value.absent(),
    this.endDate = const Value.absent(),
    this.autoRenew = const Value.absent(),
    this.reminder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required TransactionKind kind,
    required int amountMinor,
    this.merchantName = const Value.absent(),
    required String category,
    required String paymentSource,
    required CaptureSource captureSource,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.currency = const Value.absent(),
    this.note = const Value.absent(),
    this.receiptPath = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.firstBillingDate = const Value.absent(),
    this.frequency = const Value.absent(),
    this.endDate = const Value.absent(),
    this.autoRenew = const Value.absent(),
    this.reminder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       amountMinor = Value(amountMinor),
       category = Value(category),
       paymentSource = Value(paymentSource),
       captureSource = Value(captureSource),
       occurredAt = Value(occurredAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TransactionRow> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<int>? amountMinor,
    Expression<String>? merchantName,
    Expression<String>? category,
    Expression<String>? paymentSource,
    Expression<String>? captureSource,
    Expression<DateTime>? occurredAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? currency,
    Expression<String>? note,
    Expression<String>? receiptPath,
    Expression<bool>? isRecurring,
    Expression<DateTime>? firstBillingDate,
    Expression<String>? frequency,
    Expression<DateTime>? endDate,
    Expression<bool>? autoRenew,
    Expression<String>? reminder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (merchantName != null) 'merchant_name': merchantName,
      if (category != null) 'category': category,
      if (paymentSource != null) 'payment_source': paymentSource,
      if (captureSource != null) 'capture_source': captureSource,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (currency != null) 'currency': currency,
      if (note != null) 'note': note,
      if (receiptPath != null) 'receipt_path': receiptPath,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (firstBillingDate != null) 'first_billing_date': firstBillingDate,
      if (frequency != null) 'frequency': frequency,
      if (endDate != null) 'end_date': endDate,
      if (autoRenew != null) 'auto_renew': autoRenew,
      if (reminder != null) 'reminder': reminder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<TransactionKind>? kind,
    Value<int>? amountMinor,
    Value<String?>? merchantName,
    Value<String>? category,
    Value<String>? paymentSource,
    Value<CaptureSource>? captureSource,
    Value<DateTime>? occurredAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? currency,
    Value<String?>? note,
    Value<String?>? receiptPath,
    Value<bool>? isRecurring,
    Value<DateTime?>? firstBillingDate,
    Value<SubscriptionFrequency?>? frequency,
    Value<DateTime?>? endDate,
    Value<bool>? autoRenew,
    Value<SubscriptionReminder?>? reminder,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      amountMinor: amountMinor ?? this.amountMinor,
      merchantName: merchantName ?? this.merchantName,
      category: category ?? this.category,
      paymentSource: paymentSource ?? this.paymentSource,
      captureSource: captureSource ?? this.captureSource,
      occurredAt: occurredAt ?? this.occurredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      currency: currency ?? this.currency,
      note: note ?? this.note,
      receiptPath: receiptPath ?? this.receiptPath,
      isRecurring: isRecurring ?? this.isRecurring,
      firstBillingDate: firstBillingDate ?? this.firstBillingDate,
      frequency: frequency ?? this.frequency,
      endDate: endDate ?? this.endDate,
      autoRenew: autoRenew ?? this.autoRenew,
      reminder: reminder ?? this.reminder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $TransactionsTable.$converterkind.toSql(kind.value),
      );
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (paymentSource.present) {
      map['payment_source'] = Variable<String>(paymentSource.value);
    }
    if (captureSource.present) {
      map['capture_source'] = Variable<String>(
        $TransactionsTable.$convertercaptureSource.toSql(captureSource.value),
      );
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (receiptPath.present) {
      map['receipt_path'] = Variable<String>(receiptPath.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (firstBillingDate.present) {
      map['first_billing_date'] = Variable<DateTime>(firstBillingDate.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(
        $TransactionsTable.$converterfrequencyn.toSql(frequency.value),
      );
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (autoRenew.present) {
      map['auto_renew'] = Variable<bool>(autoRenew.value);
    }
    if (reminder.present) {
      map['reminder'] = Variable<String>(
        $TransactionsTable.$converterremindern.toSql(reminder.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('merchantName: $merchantName, ')
          ..write('category: $category, ')
          ..write('paymentSource: $paymentSource, ')
          ..write('captureSource: $captureSource, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('currency: $currency, ')
          ..write('note: $note, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('firstBillingDate: $firstBillingDate, ')
          ..write('frequency: $frequency, ')
          ..write('endDate: $endDate, ')
          ..write('autoRenew: $autoRenew, ')
          ..write('reminder: $reminder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankCardsTable extends BankCards
    with TableInfo<$BankCardsTable, BankCardRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _networkMeta = const VerificationMeta(
    'network',
  );
  @override
  late final GeneratedColumn<String> network = GeneratedColumn<String>(
    'network',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiryMeta = const VerificationMeta('expiry');
  @override
  late final GeneratedColumn<String> expiry = GeneratedColumn<String>(
    'expiry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<int> creditLimit = GeneratedColumn<int>(
    'credit_limit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outstandingMeta = const VerificationMeta(
    'outstanding',
  );
  @override
  late final GeneratedColumn<int> outstanding = GeneratedColumn<int>(
    'outstanding',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spentThisCycleMeta = const VerificationMeta(
    'spentThisCycle',
  );
  @override
  late final GeneratedColumn<int> spentThisCycle = GeneratedColumn<int>(
    'spent_this_cycle',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statementDueMeta = const VerificationMeta(
    'statementDue',
  );
  @override
  late final GeneratedColumn<DateTime> statementDue = GeneratedColumn<DateTime>(
    'statement_due',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _autofillOnMeta = const VerificationMeta(
    'autofillOn',
  );
  @override
  late final GeneratedColumn<bool> autofillOn = GeneratedColumn<bool>(
    'autofill_on',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("autofill_on" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    network,
    number,
    expiry,
    colorValue,
    creditLimit,
    outstanding,
    spentThisCycle,
    statementDue,
    autofillOn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<BankCardRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('network')) {
      context.handle(
        _networkMeta,
        network.isAcceptableOrUnknown(data['network']!, _networkMeta),
      );
    } else if (isInserting) {
      context.missing(_networkMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('expiry')) {
      context.handle(
        _expiryMeta,
        expiry.isAcceptableOrUnknown(data['expiry']!, _expiryMeta),
      );
    } else if (isInserting) {
      context.missing(_expiryMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditLimitMeta);
    }
    if (data.containsKey('outstanding')) {
      context.handle(
        _outstandingMeta,
        outstanding.isAcceptableOrUnknown(
          data['outstanding']!,
          _outstandingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_outstandingMeta);
    }
    if (data.containsKey('spent_this_cycle')) {
      context.handle(
        _spentThisCycleMeta,
        spentThisCycle.isAcceptableOrUnknown(
          data['spent_this_cycle']!,
          _spentThisCycleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_spentThisCycleMeta);
    }
    if (data.containsKey('statement_due')) {
      context.handle(
        _statementDueMeta,
        statementDue.isAcceptableOrUnknown(
          data['statement_due']!,
          _statementDueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statementDueMeta);
    }
    if (data.containsKey('autofill_on')) {
      context.handle(
        _autofillOnMeta,
        autofillOn.isAcceptableOrUnknown(data['autofill_on']!, _autofillOnMeta),
      );
    } else if (isInserting) {
      context.missing(_autofillOnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankCardRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankCardRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      network: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}network'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      expiry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expiry'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
      creditLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_limit'],
      )!,
      outstanding: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}outstanding'],
      )!,
      spentThisCycle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spent_this_cycle'],
      )!,
      statementDue: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}statement_due'],
      )!,
      autofillOn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}autofill_on'],
      )!,
    );
  }

  @override
  $BankCardsTable createAlias(String alias) {
    return $BankCardsTable(attachedDatabase, alias);
  }
}

class BankCardRow extends DataClass implements Insertable<BankCardRow> {
  final String id;
  final String name;
  final String network;
  final String number;
  final String expiry;
  final int colorValue;
  final int creditLimit;
  final int outstanding;
  final int spentThisCycle;
  final DateTime statementDue;
  final bool autofillOn;
  const BankCardRow({
    required this.id,
    required this.name,
    required this.network,
    required this.number,
    required this.expiry,
    required this.colorValue,
    required this.creditLimit,
    required this.outstanding,
    required this.spentThisCycle,
    required this.statementDue,
    required this.autofillOn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['network'] = Variable<String>(network);
    map['number'] = Variable<String>(number);
    map['expiry'] = Variable<String>(expiry);
    map['color_value'] = Variable<int>(colorValue);
    map['credit_limit'] = Variable<int>(creditLimit);
    map['outstanding'] = Variable<int>(outstanding);
    map['spent_this_cycle'] = Variable<int>(spentThisCycle);
    map['statement_due'] = Variable<DateTime>(statementDue);
    map['autofill_on'] = Variable<bool>(autofillOn);
    return map;
  }

  BankCardsCompanion toCompanion(bool nullToAbsent) {
    return BankCardsCompanion(
      id: Value(id),
      name: Value(name),
      network: Value(network),
      number: Value(number),
      expiry: Value(expiry),
      colorValue: Value(colorValue),
      creditLimit: Value(creditLimit),
      outstanding: Value(outstanding),
      spentThisCycle: Value(spentThisCycle),
      statementDue: Value(statementDue),
      autofillOn: Value(autofillOn),
    );
  }

  factory BankCardRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankCardRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      network: serializer.fromJson<String>(json['network']),
      number: serializer.fromJson<String>(json['number']),
      expiry: serializer.fromJson<String>(json['expiry']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      creditLimit: serializer.fromJson<int>(json['creditLimit']),
      outstanding: serializer.fromJson<int>(json['outstanding']),
      spentThisCycle: serializer.fromJson<int>(json['spentThisCycle']),
      statementDue: serializer.fromJson<DateTime>(json['statementDue']),
      autofillOn: serializer.fromJson<bool>(json['autofillOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'network': serializer.toJson<String>(network),
      'number': serializer.toJson<String>(number),
      'expiry': serializer.toJson<String>(expiry),
      'colorValue': serializer.toJson<int>(colorValue),
      'creditLimit': serializer.toJson<int>(creditLimit),
      'outstanding': serializer.toJson<int>(outstanding),
      'spentThisCycle': serializer.toJson<int>(spentThisCycle),
      'statementDue': serializer.toJson<DateTime>(statementDue),
      'autofillOn': serializer.toJson<bool>(autofillOn),
    };
  }

  BankCardRow copyWith({
    String? id,
    String? name,
    String? network,
    String? number,
    String? expiry,
    int? colorValue,
    int? creditLimit,
    int? outstanding,
    int? spentThisCycle,
    DateTime? statementDue,
    bool? autofillOn,
  }) => BankCardRow(
    id: id ?? this.id,
    name: name ?? this.name,
    network: network ?? this.network,
    number: number ?? this.number,
    expiry: expiry ?? this.expiry,
    colorValue: colorValue ?? this.colorValue,
    creditLimit: creditLimit ?? this.creditLimit,
    outstanding: outstanding ?? this.outstanding,
    spentThisCycle: spentThisCycle ?? this.spentThisCycle,
    statementDue: statementDue ?? this.statementDue,
    autofillOn: autofillOn ?? this.autofillOn,
  );
  BankCardRow copyWithCompanion(BankCardsCompanion data) {
    return BankCardRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      network: data.network.present ? data.network.value : this.network,
      number: data.number.present ? data.number.value : this.number,
      expiry: data.expiry.present ? data.expiry.value : this.expiry,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      creditLimit: data.creditLimit.present
          ? data.creditLimit.value
          : this.creditLimit,
      outstanding: data.outstanding.present
          ? data.outstanding.value
          : this.outstanding,
      spentThisCycle: data.spentThisCycle.present
          ? data.spentThisCycle.value
          : this.spentThisCycle,
      statementDue: data.statementDue.present
          ? data.statementDue.value
          : this.statementDue,
      autofillOn: data.autofillOn.present
          ? data.autofillOn.value
          : this.autofillOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankCardRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('network: $network, ')
          ..write('number: $number, ')
          ..write('expiry: $expiry, ')
          ..write('colorValue: $colorValue, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('outstanding: $outstanding, ')
          ..write('spentThisCycle: $spentThisCycle, ')
          ..write('statementDue: $statementDue, ')
          ..write('autofillOn: $autofillOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    network,
    number,
    expiry,
    colorValue,
    creditLimit,
    outstanding,
    spentThisCycle,
    statementDue,
    autofillOn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankCardRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.network == this.network &&
          other.number == this.number &&
          other.expiry == this.expiry &&
          other.colorValue == this.colorValue &&
          other.creditLimit == this.creditLimit &&
          other.outstanding == this.outstanding &&
          other.spentThisCycle == this.spentThisCycle &&
          other.statementDue == this.statementDue &&
          other.autofillOn == this.autofillOn);
}

class BankCardsCompanion extends UpdateCompanion<BankCardRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> network;
  final Value<String> number;
  final Value<String> expiry;
  final Value<int> colorValue;
  final Value<int> creditLimit;
  final Value<int> outstanding;
  final Value<int> spentThisCycle;
  final Value<DateTime> statementDue;
  final Value<bool> autofillOn;
  final Value<int> rowid;
  const BankCardsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.network = const Value.absent(),
    this.number = const Value.absent(),
    this.expiry = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.outstanding = const Value.absent(),
    this.spentThisCycle = const Value.absent(),
    this.statementDue = const Value.absent(),
    this.autofillOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankCardsCompanion.insert({
    required String id,
    required String name,
    required String network,
    required String number,
    required String expiry,
    required int colorValue,
    required int creditLimit,
    required int outstanding,
    required int spentThisCycle,
    required DateTime statementDue,
    required bool autofillOn,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       network = Value(network),
       number = Value(number),
       expiry = Value(expiry),
       colorValue = Value(colorValue),
       creditLimit = Value(creditLimit),
       outstanding = Value(outstanding),
       spentThisCycle = Value(spentThisCycle),
       statementDue = Value(statementDue),
       autofillOn = Value(autofillOn);
  static Insertable<BankCardRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? network,
    Expression<String>? number,
    Expression<String>? expiry,
    Expression<int>? colorValue,
    Expression<int>? creditLimit,
    Expression<int>? outstanding,
    Expression<int>? spentThisCycle,
    Expression<DateTime>? statementDue,
    Expression<bool>? autofillOn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (network != null) 'network': network,
      if (number != null) 'number': number,
      if (expiry != null) 'expiry': expiry,
      if (colorValue != null) 'color_value': colorValue,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (outstanding != null) 'outstanding': outstanding,
      if (spentThisCycle != null) 'spent_this_cycle': spentThisCycle,
      if (statementDue != null) 'statement_due': statementDue,
      if (autofillOn != null) 'autofill_on': autofillOn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? network,
    Value<String>? number,
    Value<String>? expiry,
    Value<int>? colorValue,
    Value<int>? creditLimit,
    Value<int>? outstanding,
    Value<int>? spentThisCycle,
    Value<DateTime>? statementDue,
    Value<bool>? autofillOn,
    Value<int>? rowid,
  }) {
    return BankCardsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      network: network ?? this.network,
      number: number ?? this.number,
      expiry: expiry ?? this.expiry,
      colorValue: colorValue ?? this.colorValue,
      creditLimit: creditLimit ?? this.creditLimit,
      outstanding: outstanding ?? this.outstanding,
      spentThisCycle: spentThisCycle ?? this.spentThisCycle,
      statementDue: statementDue ?? this.statementDue,
      autofillOn: autofillOn ?? this.autofillOn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (network.present) {
      map['network'] = Variable<String>(network.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (expiry.present) {
      map['expiry'] = Variable<String>(expiry.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<int>(creditLimit.value);
    }
    if (outstanding.present) {
      map['outstanding'] = Variable<int>(outstanding.value);
    }
    if (spentThisCycle.present) {
      map['spent_this_cycle'] = Variable<int>(spentThisCycle.value);
    }
    if (statementDue.present) {
      map['statement_due'] = Variable<DateTime>(statementDue.value);
    }
    if (autofillOn.present) {
      map['autofill_on'] = Variable<bool>(autofillOn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankCardsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('network: $network, ')
          ..write('number: $number, ')
          ..write('expiry: $expiry, ')
          ..write('colorValue: $colorValue, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('outstanding: $outstanding, ')
          ..write('spentThisCycle: $spentThisCycle, ')
          ..write('statementDue: $statementDue, ')
          ..write('autofillOn: $autofillOn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BankCardsTable bankCards = $BankCardsTable(this);
  late final TransactionsDao transactionsDao = TransactionsDao(
    this as AppDatabase,
  );
  late final CardsDao cardsDao = CardsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions, bankCards];
}

typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required TransactionKind kind,
      required int amountMinor,
      Value<String?> merchantName,
      required String category,
      required String paymentSource,
      required CaptureSource captureSource,
      required DateTime occurredAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String> currency,
      Value<String?> note,
      Value<String?> receiptPath,
      Value<bool> isRecurring,
      Value<DateTime?> firstBillingDate,
      Value<SubscriptionFrequency?> frequency,
      Value<DateTime?> endDate,
      Value<bool> autoRenew,
      Value<SubscriptionReminder?> reminder,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<TransactionKind> kind,
      Value<int> amountMinor,
      Value<String?> merchantName,
      Value<String> category,
      Value<String> paymentSource,
      Value<CaptureSource> captureSource,
      Value<DateTime> occurredAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> currency,
      Value<String?> note,
      Value<String?> receiptPath,
      Value<bool> isRecurring,
      Value<DateTime?> firstBillingDate,
      Value<SubscriptionFrequency?> frequency,
      Value<DateTime?> endDate,
      Value<bool> autoRenew,
      Value<SubscriptionReminder?> reminder,
      Value<int> rowid,
    });

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionKind, TransactionKind, String>
  get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchantName => $composableBuilder(
    column: $table.merchantName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CaptureSource, CaptureSource, String>
  get captureSource => $composableBuilder(
    column: $table.captureSource,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get firstBillingDate => $composableBuilder(
    column: $table.firstBillingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    SubscriptionFrequency?,
    SubscriptionFrequency,
    String
  >
  get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autoRenew => $composableBuilder(
    column: $table.autoRenew,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    SubscriptionReminder?,
    SubscriptionReminder,
    String
  >
  get reminder => $composableBuilder(
    column: $table.reminder,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchantName => $composableBuilder(
    column: $table.merchantName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get captureSource => $composableBuilder(
    column: $table.captureSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get firstBillingDate => $composableBuilder(
    column: $table.firstBillingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autoRenew => $composableBuilder(
    column: $table.autoRenew,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminder => $composableBuilder(
    column: $table.reminder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TransactionKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get merchantName => $composableBuilder(
    column: $table.merchantName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CaptureSource, String> get captureSource =>
      $composableBuilder(
        column: $table.captureSource,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get firstBillingDate => $composableBuilder(
    column: $table.firstBillingDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SubscriptionFrequency?, String>
  get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get autoRenew =>
      $composableBuilder(column: $table.autoRenew, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SubscriptionReminder?, String>
  get reminder =>
      $composableBuilder(column: $table.reminder, builder: (column) => column);
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          TransactionRow,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (
            TransactionRow,
            BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow>,
          ),
          TransactionRow,
          PrefetchHooks Function()
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<TransactionKind> kind = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String?> merchantName = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> paymentSource = const Value.absent(),
                Value<CaptureSource> captureSource = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> receiptPath = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<DateTime?> firstBillingDate = const Value.absent(),
                Value<SubscriptionFrequency?> frequency = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> autoRenew = const Value.absent(),
                Value<SubscriptionReminder?> reminder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                kind: kind,
                amountMinor: amountMinor,
                merchantName: merchantName,
                category: category,
                paymentSource: paymentSource,
                captureSource: captureSource,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currency: currency,
                note: note,
                receiptPath: receiptPath,
                isRecurring: isRecurring,
                firstBillingDate: firstBillingDate,
                frequency: frequency,
                endDate: endDate,
                autoRenew: autoRenew,
                reminder: reminder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required TransactionKind kind,
                required int amountMinor,
                Value<String?> merchantName = const Value.absent(),
                required String category,
                required String paymentSource,
                required CaptureSource captureSource,
                required DateTime occurredAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String> currency = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> receiptPath = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<DateTime?> firstBillingDate = const Value.absent(),
                Value<SubscriptionFrequency?> frequency = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> autoRenew = const Value.absent(),
                Value<SubscriptionReminder?> reminder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                kind: kind,
                amountMinor: amountMinor,
                merchantName: merchantName,
                category: category,
                paymentSource: paymentSource,
                captureSource: captureSource,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                currency: currency,
                note: note,
                receiptPath: receiptPath,
                isRecurring: isRecurring,
                firstBillingDate: firstBillingDate,
                frequency: frequency,
                endDate: endDate,
                autoRenew: autoRenew,
                reminder: reminder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionsTable, TransactionRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $TransactionsTable,
                    TransactionRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      TransactionRow,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (
        TransactionRow,
        BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow>,
      ),
      TransactionRow,
      PrefetchHooks Function()
    >;
typedef $$BankCardsTableCreateCompanionBuilder = BankCardsCompanion Function({
  required String id,
  required String name,
  required String network,
  required String number,
  required String expiry,
  required int colorValue,
  required int creditLimit,
  required int outstanding,
  required int spentThisCycle,
  required DateTime statementDue,
  required bool autofillOn,
  Value<int> rowid,
});
typedef $$BankCardsTableUpdateCompanionBuilder = BankCardsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> network,
  Value<String> number,
  Value<String> expiry,
  Value<int> colorValue,
  Value<int> creditLimit,
  Value<int> outstanding,
  Value<int> spentThisCycle,
  Value<DateTime> statementDue,
  Value<bool> autofillOn,
  Value<int> rowid,
});

class $$BankCardsTableFilterComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expiry => $composableBuilder(
    column: $table.expiry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get outstanding => $composableBuilder(
    column: $table.outstanding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spentThisCycle => $composableBuilder(
    column: $table.spentThisCycle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get statementDue => $composableBuilder(
    column: $table.statementDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get autofillOn => $composableBuilder(
    column: $table.autofillOn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BankCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expiry => $composableBuilder(
    column: $table.expiry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get outstanding => $composableBuilder(
    column: $table.outstanding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spentThisCycle => $composableBuilder(
    column: $table.spentThisCycle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get statementDue => $composableBuilder(
    column: $table.statementDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get autofillOn => $composableBuilder(
    column: $table.autofillOn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BankCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get network =>
      $composableBuilder(column: $table.network, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get expiry =>
      $composableBuilder(column: $table.expiry, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get outstanding => $composableBuilder(
    column: $table.outstanding,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spentThisCycle => $composableBuilder(
    column: $table.spentThisCycle,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get statementDue => $composableBuilder(
    column: $table.statementDue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get autofillOn => $composableBuilder(
    column: $table.autofillOn,
    builder: (column) => column,
  );
}

class $$BankCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BankCardsTable,
          BankCardRow,
          $$BankCardsTableFilterComposer,
          $$BankCardsTableOrderingComposer,
          $$BankCardsTableAnnotationComposer,
          $$BankCardsTableCreateCompanionBuilder,
          $$BankCardsTableUpdateCompanionBuilder,
          (
            BankCardRow,
            BaseReferences<_$AppDatabase, $BankCardsTable, BankCardRow>,
          ),
          BankCardRow,
          PrefetchHooks Function()
        > {
  $$BankCardsTableTableManager(_$AppDatabase db, $BankCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> network = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<String> expiry = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<int> creditLimit = const Value.absent(),
                Value<int> outstanding = const Value.absent(),
                Value<int> spentThisCycle = const Value.absent(),
                Value<DateTime> statementDue = const Value.absent(),
                Value<bool> autofillOn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion(
                id: id,
                name: name,
                network: network,
                number: number,
                expiry: expiry,
                colorValue: colorValue,
                creditLimit: creditLimit,
                outstanding: outstanding,
                spentThisCycle: spentThisCycle,
                statementDue: statementDue,
                autofillOn: autofillOn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String network,
                required String number,
                required String expiry,
                required int colorValue,
                required int creditLimit,
                required int outstanding,
                required int spentThisCycle,
                required DateTime statementDue,
                required bool autofillOn,
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion.insert(
                id: id,
                name: name,
                network: network,
                number: number,
                expiry: expiry,
                colorValue: colorValue,
                creditLimit: creditLimit,
                outstanding: outstanding,
                spentThisCycle: spentThisCycle,
                statementDue: statementDue,
                autofillOn: autofillOn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BankCardsTable, BankCardRow>(table),
                  BaseReferences<_$AppDatabase, $BankCardsTable, BankCardRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BankCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BankCardsTable,
      BankCardRow,
      $$BankCardsTableFilterComposer,
      $$BankCardsTableOrderingComposer,
      $$BankCardsTableAnnotationComposer,
      $$BankCardsTableCreateCompanionBuilder,
      $$BankCardsTableUpdateCompanionBuilder,
      (
        BankCardRow,
        BaseReferences<_$AppDatabase, $BankCardsTable, BankCardRow>,
      ),
      BankCardRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db, _db.bankCards);
}
