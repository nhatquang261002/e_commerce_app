// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'network_products_bloc.dart';

enum NetworkStatus { initial, loading, success, failure }

class NetworkProductsState extends Equatable {
  final NetworkStatus status;
  final bool categoriesFetched;
  final List<String> categories;
  final List<ProductModel> products;

  const NetworkProductsState({
    this.status = NetworkStatus.initial,
    this.categoriesFetched = false,
    this.categories = const <String>[],
    this.products = const <ProductModel>[],
  });

  NetworkProductsState copyWith({
    NetworkStatus? status,
    bool? categoriesFetched,
    List<String>? categories,
    List<ProductModel>? products,
  }) {
    return NetworkProductsState(
      status: status ?? this.status,
      categoriesFetched: categoriesFetched ?? this.categoriesFetched,
      categories: categories ?? this.categories,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products, categories, categoriesFetched];
}
