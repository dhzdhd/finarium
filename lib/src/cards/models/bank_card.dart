import 'package:flutter/material.dart';

class const BankCard({
  required final String id,
  required final String name,
  required final String network,
  required final String number,
  required final String expiry,
  required final Color color,
  required final int creditLimit,
  required final int outstanding,
  required final int spentThisCycle,
  required final DateTime statementDue,
  required final bool autofillOn,
}) {
  String get last4 => number.substring(number.length - 4);

  double get limitUsed => outstanding / creditLimit;
}
