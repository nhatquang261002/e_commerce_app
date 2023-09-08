// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<ProductModel> products;

  const CartState({this.products = const []});

  CartState copyWith({
    required List<ProductModel> products,
  }) {
    return CartState(
      products: products,
    );
  }

  @override
  List<Object> get props => [products];
}
