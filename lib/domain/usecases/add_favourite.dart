import '../../data/models/product.dart';
import '../repository/store_repository.dart';

class SaveFavouriteProductUseCase {
  final StoreRepository _repository;
  const SaveFavouriteProductUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<void> call({required ProductModel product}) async {
    await _repository.saveFavProduct(product: product);
  }
}
