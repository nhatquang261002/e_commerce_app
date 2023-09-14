// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/presentation/bloc/network_products_bloc/network_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/view/widgets/added_to_cart_dialog.dart';

class ItemTile extends StatelessWidget {
  ProductModel product;
  ItemTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;
    final backgroundColor = Theme.of(context).colorScheme.background;

    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: size.width * 0.35,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/details', extra: product);
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<FavouriteBloc, FavouriteState>(
                  builder: (context, favState) {
                    final prodInFav = favState.favourites
                        .where(
                          (element) => element.id == product.id,
                        )
                        .firstOrNull;
                    if (prodInFav != null) {
                      product = prodInFav;
                    }
                    return IconButton(
                      onPressed: () {
                        if (product.isFavourite == false) {
                          context
                              .read<NetworkProductsBloc>()
                              .add(UpdateProduct(product));
                          context
                              .read<FavouriteBloc>()
                              .add(AddTofavourite(product: product));
                        } else {
                          context
                              .read<NetworkProductsBloc>()
                              .add(UpdateProduct(product));
                          context
                              .read<FavouriteBloc>()
                              .add(DeleteFromFavourite(product: product));
                        }
                      },
                      isSelected: product.isFavourite,
                      icon: const Icon(Icons.favorite_border_outlined),
                      selectedIcon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
                Center(
                  child: SizedBox(
                    height: size.height * 0.10,
                    child: Image.network(product.image!, fit: BoxFit.fitWidth),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'BEST SELLER',
                    style: Theme.of(context)
                        .textTheme
                        .copyWith(
                            displayMedium: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                        .displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    product.title!,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            Positioned(
              width: size.width * 0.35,
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(product: product));
                      addedToCartDialog(context, product);
                    },
                    style: IconButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14)))),
                    icon: Icon(
                      Icons.add,
                      weight: 1,
                      color: backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
