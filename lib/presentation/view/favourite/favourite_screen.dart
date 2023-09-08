import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/item_tile.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favourites',
          style: textTheme.headlineSmall,
        ),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: state.favourites.length,
            itemBuilder: (context, index) {
              return ItemTile(product: state.favourites[index]);
            },
          );
        },
      ),
    );
  }
}
