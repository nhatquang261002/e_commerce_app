import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/product.dart';

class FakeStoreApi {
  final dio = Dio();

  // Fetch all the products
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      Response response;
      response = await dio.get('https://fakestoreapi.com/products');
      List<dynamic> l = response.data as List;

      List<ProductModel> products = [];
      for (var element in l) {
        products.add(ProductModel.fromMap(element as Map<String, dynamic>));
      }

      return products;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return [];
  }

  // Fetch all the products
  Future getSingleProduct(int productID) async {
    try {
      Response response;
      response = await dio.get('https://fakestoreapi.com/products/$productID');

      ProductModel product = ProductModel.fromMap(response.data);

      return product;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  // Fetch the categories
  Future<List<String>> getCategories() async {
    try {
      Response response;
      response = await dio.get('https://fakestoreapi.com/products/categories');

      List<dynamic> l = response.data as List;
      List<String> categories = [];
      for (var element in l) {
        categories.add(element.toString());
      }

      return categories;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      return [];
    }
  }

  // Fetch the products in a specific category
  Future<List<ProductModel>> getProductsInCategory(
      {required String category}) async {
    try {
      Response response;
      if (category == 'all items') {
        response = await dio.get('https://fakestoreapi.com/products');
      } else {
        response = await dio
            .get('https://fakestoreapi.com/products/category/$category');
      }

      List<dynamic> l = response.data as List;
      List<ProductModel> categoryProducts = [];
      for (var element in l) {
        categoryProducts
            .add(ProductModel.fromMap(element as Map<String, dynamic>));
      }
      return categoryProducts;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      return [];
    }
  }
}
