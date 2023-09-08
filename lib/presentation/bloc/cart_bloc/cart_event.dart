part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AddToCart extends CartEvent {
  final ProductModel product;

  AddToCart({required this.product});

  @override
  List<Object> get props => [product];
}

final class DeleteFromCart extends CartEvent {
  final ProductModel product;

  DeleteFromCart(this.product);
}
