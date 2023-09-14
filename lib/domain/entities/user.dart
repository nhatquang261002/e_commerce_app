import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class UserEntity {
  final Id isarId;
  final String? firstName;
  final String? lastName;
  final String? location;
  final int? phoneNumber;
  final String email;
  final String password;

  const UserEntity(
      {this.firstName,
      this.lastName,
      this.location,
      this.phoneNumber,
      required this.email,
      required this.password})
      : isarId = 1;
}
