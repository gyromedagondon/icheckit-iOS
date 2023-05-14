import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icheckit_final/model/enums/enums.dart';

import 'converters/datetime_converter.dart';

part 'student.model.freezed.dart';
part 'student.model.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    // String? id, // this is firebase auth user uid
    String? uid, // this is firebase auth user uid``
    required String email,
    required String firstName,
    required String lastName,
    required String course,
    required String section,
    required String contactNumber,
    String? displayName,
    String? photoUrl,
    String? pushToken,
    @Default(UserType.student) UserType? role,
    // @Default(UserType.student) UserType? userType,
    @CustomDateTimeConverter() DateTime? createdAt,
    String? createdUsing,
    // @CustomDateTimeConverter() DateTime? updatedAt,
    // String? updatedBy,
    @Default(false) bool isVerified,
    // String? verifiedBy,
    // @CustomDateTimeConverter() DateTime? verifiedAt,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}
