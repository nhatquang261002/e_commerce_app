import '../repository/store_repository.dart';

class GetAllCategoriesUseCase {
  final StoreRepository _repository;
  GetAllCategoriesUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<List<String>> call() async {
    final list = await _repository.getAllCategories();

    return list;
  }
}
