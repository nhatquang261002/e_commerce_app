import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class GetSingleProductUseCase {
  final StoreRepository repository;

  GetSingleProductUseCase({required this.repository});

  Future<ProductModel> call({required int productID}) async {
    ProductModel product =
        await repository.getSingleProduct(productID: productID);
    return product;
  }
}
