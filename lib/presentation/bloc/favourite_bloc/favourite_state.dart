// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final List<ProductModel> favourites;

  const FavouriteState({
    this.favourites = const <ProductModel>[],
  });

  FavouriteState copyWith({
    List<ProductModel>? favourites,
  }) {
    return FavouriteState(
      favourites: favourites ?? this.favourites,
    );
  }

  @override
  List<Object> get props => [favourites];
}
