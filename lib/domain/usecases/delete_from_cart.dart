import '../../data/models/product.dart';
import '../repository/store_repository.dart';

class DeleteInCartProductUseCase {
  final StoreRepository _repository;
  const DeleteInCartProductUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<void> call({required ProductModel product}) async {
    await _repository.deleteInCartProduct(product: product);
  }
}
