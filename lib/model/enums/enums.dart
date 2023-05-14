import 'package:freezed_annotation/freezed_annotation.dart';

enum UserType {
  @JsonValue('Student')
  student('Student');

  const UserType(this.thistype);
  final String thistype;
}

enum StudentTaskState {
  done,
  pending,
  urgent,
  late,
  recent,
}

enum TaskType {
  verification,
  regular,
}
