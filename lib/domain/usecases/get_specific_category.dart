import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class GetSpecificCategoryUseCase {
  final StoreRepository _repository;

  GetSpecificCategoryUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<List<ProductModel>> call({required String category}) async {
    final list = await _repository.getSpecificCategory(category: category);

    return list;
  }
}
