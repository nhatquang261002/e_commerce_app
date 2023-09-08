// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/data/data_sources/network/fake_store_api.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final FakeStoreApi _api;

  StoreRepositoryImpl({
    required FakeStoreApi api,
  }) : _api = api;

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
}
