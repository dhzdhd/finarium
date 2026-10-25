import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant.freezed.dart';
part 'merchant.g.dart';

@freezed
sealed class Merchant with _$Merchant {
  const factory Merchant.unknown() = UnknownMerchant;

  const factory Merchant.named(String name) = NamedMerchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
