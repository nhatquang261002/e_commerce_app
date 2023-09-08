import 'package:e_commerce_app/data/models/product.dart';

abstract class StoreRepository {
  Future<List<ProductModel>> getAllProducts();

  Future getSingleProduct({required int productID});

  Future<List<String>> getAllCategories();

  Future<List<ProductModel>> getSpecificCategory({required String category});
}
