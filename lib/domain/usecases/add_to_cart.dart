import '../../data/models/product.dart';
import '../repository/store_repository.dart';

class SaveInCartProductUseCase {
  final StoreRepository _repository;
  const SaveInCartProductUseCase({required StoreRepository repository})
      : _repository = repository;

  Future<void> call({required ProductModel product}) async {
    await _repository.saveInCartProduct(product: product);
  }
}
