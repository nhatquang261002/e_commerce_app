// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

enum Action { add, remove, none }

class CartState extends Equatable {
  final List<ProductModel> products;
  final Action action;

  const CartState({
    this.products = const [],
    this.action = Action.none,
  });

  @override
  List<Object> get props => [products, action];

  CartState copyWith({
    List<ProductModel>? products,
    Action? action,
  }) {
    return CartState(
      products: products ?? this.products,
      action: action ?? this.action,
    );
  }
}
