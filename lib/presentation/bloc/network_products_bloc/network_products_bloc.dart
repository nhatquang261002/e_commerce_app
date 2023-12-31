import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/usecases/get_single_product.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/domain/usecases/get_all_categories.dart';
import 'package:e_commerce_app/domain/usecases/get_all_products.dart';
import 'package:e_commerce_app/domain/usecases/get_specific_category.dart';

part 'network_products_event.dart';
part 'network_products_state.dart';

class NetworkProductsBloc
    extends Bloc<NetworkProductsEvent, NetworkProductsState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetSpecificCategoryUseCase _getSpecificCategoryUseCase;
  final GetSingleProductUseCase _getSingleProductUseCase;

  NetworkProductsBloc({
    required GetAllProductsUseCase getAllProducts,
    required GetAllCategoriesUseCase getAllCategories,
    required GetSpecificCategoryUseCase getSpecificCategory,
    required GetSingleProductUseCase getSingleProductUseCase,
  })  : _getAllProductsUseCase = getAllProducts,
        _getAllCategoriesUseCase = getAllCategories,
        _getSpecificCategoryUseCase = getSpecificCategory,
        _getSingleProductUseCase = getSingleProductUseCase,
        super(const NetworkProductsState()) {
    on<ProductsFetched>(_productsFetched);
    on<CategoriesFetched>(_categoriesFetched);
    on<CategoryProductsFetched>(_categoryProductsFetched);
    on<UpdateProduct>(_updateProduct);
  }

  Future<void> _productsFetched(
      ProductsFetched event, Emitter<NetworkProductsState> emit) async {
    try {
      emit(state.copyWith(status: NetworkStatus.loading));
      final productsList = await _getAllProductsUseCase();

      emit(
        state.copyWith(
          status: NetworkStatus.success,
          products: productsList,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  Future<void> _categoriesFetched(
      CategoriesFetched event, Emitter<NetworkProductsState> emit) async {
    try {
      emit(state.copyWith(categoriesFetched: false));
      List<String> categories = ['all items'];

      final fetchedCategories = await _getAllCategoriesUseCase();

      for (var element in fetchedCategories) {
        categories.add(element);
      }

      emit(state.copyWith(
          status: NetworkStatus.success,
          categories: categories,
          categoriesFetched: true));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  Future<void> _categoryProductsFetched(
      CategoryProductsFetched event, Emitter<NetworkProductsState> emit) async {
    try {
      emit(state.copyWith(status: NetworkStatus.loading));

      final categoryProducts =
          await _getSpecificCategoryUseCase(category: event.category);

      emit(state.copyWith(
          status: NetworkStatus.success, products: categoryProducts));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

  void _updateProduct(
      UpdateProduct event, Emitter<NetworkProductsState> emit) async {
    List<ProductModel> list = [];
    list = [...state.products];
    list.where((element) => element.id == event.product.id).first.isFavourite =
        event.product.isFavourite;

    emit(state.copyWith(products: list));
  }
}
