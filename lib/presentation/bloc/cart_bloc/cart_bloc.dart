import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>(_addToCart);
    on<DeleteFromCart>(_deleteFromCart);
  }

  void _addToCart(AddToCart event, Emitter<CartState> emit) {
    List<ProductModel> cart = state.products;
    cart = [...cart, event.product];
    emit(CartState(products: cart));
  }

  void _deleteFromCart(DeleteFromCart event, Emitter<CartState> emit) {
    List<ProductModel> cart = [];
    cart = [...state.products];
    cart.remove(event.product);
    emit(CartState(products: cart));
  }
}
