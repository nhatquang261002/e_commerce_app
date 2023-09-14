import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class ReduceInCartUseCase {
  final StoreRepository storeRepository;
  const ReduceInCartUseCase({required this.storeRepository});

  Future<void> call({required ProductModel product}) async {
    await storeRepository.reduceInCart(product: product);
  }
}
