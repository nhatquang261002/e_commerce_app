import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/data/models/user.dart';

abstract class StoreRepository {
  Future<List<ProductModel>> getAllProducts();

  Future getSingleProduct({required int productID});

  Future<List<String>> getAllCategories();

  Future<List<ProductModel>> getSpecificCategory({required String category});

  Future<List<ProductModel>> getAllFavProducts();

  Future<void> saveFavProduct({required ProductModel product});

  Future<void> deleteFavProduct({required ProductModel product});

  Future<List<ProductModel>> getAllCartProducts();

  Future<void> saveInCartProduct({required ProductModel product});

  Future<void> deleteInCartProduct({required ProductModel product});

  Future<void> saveUser({required UserModel user});

  Future<UserModel> getUser({required String email});

  Future<void> reduceInCart({required ProductModel product});
}
