import 'package:e_commerce_app/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String? firstName,
      required String? lastName,
      required String? location,
      required int? phoneNumber,
      required String email,
      required String password})
      : super(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            location: location,
            phoneNumber: phoneNumber);
}
