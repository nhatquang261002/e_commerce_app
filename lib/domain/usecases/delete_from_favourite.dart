import '../../data/models/product.dart';
import '../repository/store_repository.dart';

class DeleteFavProductUseCase {
  final StoreRepository _repository;
  const DeleteFavProductUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<void> call({required ProductModel product}) async {
    await _repository.deleteFavProduct(product: product);
  }
}
