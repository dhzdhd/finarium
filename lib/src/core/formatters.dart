import 'package:flutter/services.dart';

const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String formatInr(int amount) {
  final digits = amount.abs().toString();
  if (digits.length <= 3) return '₹$digits';

  final last3 = digits.substring(digits.length - 3);
  final rest = digits.substring(0, digits.length - 3);
  final grouped = rest.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{2})+$)'),
    (match) => '${match[1]},',
  );
  return '₹$grouped,$last3';
}

String formatDayMonth(DateTime date) => '${date.day} ${_months[date.month - 1]}';

String groupCardNumber(String digits) {
  return RegExp(r'.{1,4}')
      .allMatches(digits)
      .map((match) => match.group(0)!)
      .join(' ');
}

class CardNumberInputFormatter extends TextInputFormatter {
  const CardNumberInputFormatter();

  static const _maxDigits = 16;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldDigits = oldValue.text.replaceAll(RegExp(r'\D'), '');
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    final deletedASpace = newValue.text.length < oldValue.text.length &&
        digits == oldDigits;
    if (deletedASpace && digits.isNotEmpty) {
      digits = digits.substring(0, digits.length - 1);
    }

    if (digits.length > _maxDigits) {
      digits = digits.substring(0, _maxDigits);
    }

    final formatted = groupCardNumber(digits);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
