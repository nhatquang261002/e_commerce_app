part of 'favourite_bloc.dart';

class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddTofavourite extends FavouriteEvent {
  final ProductModel product;

  const AddTofavourite({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteFromFavourite extends FavouriteEvent {
  final ProductModel product;

  const DeleteFromFavourite({required this.product});

  @override
  List<Object> get props => [product];
}
