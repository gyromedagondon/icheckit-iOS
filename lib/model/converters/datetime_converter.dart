import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, int> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(int value) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  @override
  int toJson(DateTime value) => value.millisecondsSinceEpoch;
}
