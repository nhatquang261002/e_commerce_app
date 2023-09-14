import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/usecases/add_favourite.dart';
import 'package:e_commerce_app/domain/usecases/delete_from_favourite.dart';
import 'package:e_commerce_app/domain/usecases/get_all_favourite_products.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce_app/data/models/product.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final GetAllFavouriteProductsUseCase getAllFavouriteProductsUseCase;
  final SaveFavouriteProductUseCase saveFavouriteProductUseCase;
  final DeleteFavProductUseCase deleteFavProductUseCase;
  FavouriteBloc(
      {required this.getAllFavouriteProductsUseCase,
      required this.saveFavouriteProductUseCase,
      required this.deleteFavProductUseCase})
      : super(const FavouriteState()) {
    on<FavouriteProductsInit>(_getAllFavProducts);
    on<AddTofavourite>(_addToFavourite);
    on<DeleteFromFavourite>(_deleteFromFavourite);
  }

  void _getAllFavProducts(
      FavouriteProductsInit event, Emitter<FavouriteState> emit) async {
    List<ProductModel> favProducts = [];
    final favourites = await getAllFavouriteProductsUseCase();
    for (var e in favourites) {
      favProducts.add(e);
    }
    emit(FavouriteState(favourites: favProducts));
  }

  void _addToFavourite(
      AddTofavourite event, Emitter<FavouriteState> emit) async {
    List<ProductModel> favourites = state.favourites;
    await saveFavouriteProductUseCase(product: event.product);
    event.product.isFavourite = true;
    favourites = [...favourites, event.product];

    emit(state.copyWith(favourites: favourites));
  }

  void _deleteFromFavourite(
      DeleteFromFavourite event, Emitter<FavouriteState> emit) async {
    List<ProductModel> favourites = [];
    favourites = [...state.favourites];
    event.product.isFavourite = false;
    await deleteFavProductUseCase(product: event.product);
    favourites.removeWhere((element) => element.id == event.product.id);

    emit(state.copyWith(favourites: favourites));
  }
}
