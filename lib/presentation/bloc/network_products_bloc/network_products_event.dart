// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'network_products_bloc.dart';

sealed class NetworkProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsFetched extends NetworkProductsEvent {
  final List<ProductModel> products;

  ProductsFetched({
    this.products = const <ProductModel>[],
  });

  @override
  List<Object> get props => [products];
}

class CategoriesFetched extends NetworkProductsEvent {}

class CategoryProductsFetched extends NetworkProductsEvent {
  final String category;

  CategoryProductsFetched({required this.category});

  @override
  List<Object> get props => [category];
}

class UpdateProduct extends NetworkProductsEvent {
  final ProductModel product;

  UpdateProduct(
    this.product,
  );

  @override
  List<Object> get props => [product];
}
