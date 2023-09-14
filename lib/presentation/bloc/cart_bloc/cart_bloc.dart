import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/usecases/add_to_cart.dart';
import 'package:e_commerce_app/domain/usecases/delete_from_cart.dart';
import 'package:e_commerce_app/domain/usecases/get_all_in_cart_products.dart';
import 'package:e_commerce_app/domain/usecases/reduce_in_cart.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartProductsUseCase getAllCartProductsUseCase;
  final SaveInCartProductUseCase saveInCartProductUseCase;
  final DeleteInCartProductUseCase deleteInCartProductUseCase;
  final ReduceInCartUseCase reduceInCartUseCase;
  CartBloc({
    required this.deleteInCartProductUseCase,
    required this.getAllCartProductsUseCase,
    required this.saveInCartProductUseCase,
    required this.reduceInCartUseCase,
  }) : super(const CartState()) {
    on<CartProductsInit>(_cartInit);
    on<AddToCart>(_addToCart);
    on<ReduceInCart>(_reduceInCart);
    on<DeleteFromCart>(_deleteFromCart);
  }

  void _cartInit(CartProductsInit event, Emitter<CartState> emit) async {
    emit(const CartState(action: Action.none));
    List<ProductModel> cart = [];
    final products = await getAllCartProductsUseCase();
    for (var e in products) {
      cart.add(e);
    }

    emit(CartState(products: cart, action: Action.add));
  }

  void _addToCart(AddToCart event, Emitter<CartState> emit) {
    emit(state.copyWith(action: Action.none));
    List<ProductModel> cart = [];
    saveInCartProductUseCase(product: event.product);
    if (state.products.contains(event.product)) {
      cart = [...state.products];
    } else {
      cart = [...state.products, event.product];
    }

    emit(CartState(products: cart, action: Action.add));
  }

  void _reduceInCart(ReduceInCart event, Emitter<CartState> emit) {
    emit(state.copyWith(action: Action.none));
    reduceInCartUseCase(product: event.product);

    if (event.product.quantityInCart == 1) {
      List<ProductModel> cart = [];

      cart = [...state.products];
      cart.remove(event.product);
      emit(state.copyWith(action: Action.remove, products: cart));
    } else {
      emit(state.copyWith(action: Action.remove));
    }
  }

  void _deleteFromCart(DeleteFromCart event, Emitter<CartState> emit) {
    emit(state.copyWith(action: Action.none));
    List<ProductModel> cart = [];

    cart = [...state.products];
    deleteInCartProductUseCase(product: event.product);
    cart.remove(event.product);
    emit(CartState(products: cart, action: Action.remove));
  }
}
