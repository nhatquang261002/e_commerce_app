import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class SaveUserUserCase {
  final StoreRepository repository;

  SaveUserUserCase({required this.repository});

  Future call({required UserModel user}) async {
    repository.saveUser(user: user);
  }
}
