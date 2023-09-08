import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class GetAllProductsUseCase {
  final StoreRepository _repository;
  GetAllProductsUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<List<ProductModel>> call() async {
    final list = await _repository.getAllProducts();
    return list;
  }
}
