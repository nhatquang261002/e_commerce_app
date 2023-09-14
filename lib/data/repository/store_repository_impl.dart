// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/data/data_sources/local/isar_db.dart';
import 'package:e_commerce_app/data/data_sources/network/fake_store_api.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

import '../models/user.dart';

class StoreRepositoryImpl implements StoreRepository {
  final FakeStoreApi _api;
  final IsarDatabase _isar;

  StoreRepositoryImpl({
    required FakeStoreApi api,
    required IsarDatabase isar,
  })  : _api = api,
        _isar = isar;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final fetchedList = await _api.fetchAllProducts();

    return fetchedList;
  }

  @override
  Future<List<String>> getAllCategories() async {
    final categories = await _api.getCategories();

    return categories;
  }

  @override
  Future<List<ProductModel>> getSpecificCategory(
      {required String category}) async {
    final fetchedList = await _api.getProductsInCategory(category: category);

    return fetchedList;
  }

  @override
  Future getSingleProduct({required int productID}) async {
    final ProductModel product = await _api.getSingleProduct(productID);

    return product;
  }

  @override
  Future saveFavProduct({required ProductModel product}) async {
    await _isar.saveFavouriteProduct(product);
  }

  @override
  Future<List<ProductModel>> getAllFavProducts() async {
    List<ProductModel> favProducts = await _isar.getAllFavProducts();
    return favProducts;
  }

  @override
  Future<void> deleteFavProduct({required ProductModel product}) async {
    await _isar.deleteFavouriteProduct(product);
  }

  @override
  Future<void> deleteInCartProduct({required ProductModel product}) async {
    await _isar.deleteInCartProduct(product);
  }

  @override
  Future<List<ProductModel>> getAllCartProducts() async {
    List<ProductModel> cartProducts = await _isar.getAllInCartProducts();
    return cartProducts;
  }

  @override
  Future<void> saveInCartProduct({required ProductModel product}) async {
    await _isar.saveInCartProduct(product);
  }

  @override
  Future<void> saveUser({required UserModel user}) async {
    await _isar.saveUser(user);
  }

  @override
  Future<UserModel> getUser({required String email}) async {
    return await _isar.readUser(email);
  }

  @override
  Future<void> reduceInCart({required ProductModel product}) async {
    await _isar.reduceInCart(product);
  }
}
