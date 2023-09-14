import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class GetAllFavouriteProductsUseCase {
  final StoreRepository _repository;
  GetAllFavouriteProductsUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<List<ProductModel>> call() async {
    final list = await _repository.getAllFavProducts();
    return list;
  }
}
