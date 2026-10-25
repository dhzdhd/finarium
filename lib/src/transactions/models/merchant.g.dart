// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnknownMerchant _$UnknownMerchantFromJson(Map<String, dynamic> json) =>
    UnknownMerchant($type: json['runtimeType'] as String?);

Map<String, dynamic> _$UnknownMerchantToJson(UnknownMerchant instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

NamedMerchant _$NamedMerchantFromJson(Map<String, dynamic> json) =>
    NamedMerchant(
      json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$NamedMerchantToJson(NamedMerchant instance) =>
    <String, dynamic>{'name': instance.name, 'runtimeType': instance.$type};
