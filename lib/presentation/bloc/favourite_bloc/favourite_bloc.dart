import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce_app/data/models/product.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<AddTofavourite>(_addToFavourite);
    on<DeleteFromFavourite>(_deleteFromFavourite);
  }

  void _addToFavourite(AddTofavourite event, Emitter<FavouriteState> emit) {
    List<ProductModel> favourites = state.favourites;
    favourites = [...favourites, event.product];

    emit(state.copyWith(favourites: favourites));
  }

  void _deleteFromFavourite(
      DeleteFromFavourite event, Emitter<FavouriteState> emit) {
    List<ProductModel> favourites = [];
    favourites = [...state.favourites];
    favourites.remove(event.product);

    emit(state.copyWith(favourites: favourites));
  }
}
