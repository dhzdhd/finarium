import 'package:fpdart/fpdart.dart';
import 'package:json_annotation/json_annotation.dart';

class OptionStringConverter implements JsonConverter<Option<String>, String?> {
  const OptionStringConverter();

  @override
  Option<String> fromJson(String? json) => Option.fromNullable(json);

  @override
  String? toJson(Option<String> object) => object.toNullable();
}

class OptionDateTimeConverter
    implements JsonConverter<Option<DateTime>, String?> {
  const OptionDateTimeConverter();

  @override
  Option<DateTime> fromJson(String? json) =>
      Option.fromNullable(json).map(DateTime.parse);

  @override
  String? toJson(Option<DateTime> object) =>
      object.map((date) => date.toIso8601String()).toNullable();
}
