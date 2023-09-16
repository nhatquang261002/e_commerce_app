import 'package:e_commerce_app/domain/repository/store_repository.dart';

import '../../data/models/user.dart';

class GetUserUsecase {
  final StoreRepository repository;

  GetUserUsecase({required this.repository});

  Future<UserModel> call() async {
    return repository.getUser();
  }
}
