// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartTile extends StatelessWidget {
  ProductModel product;
  CartTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Stack(
        children: [
          ListTile(
            leading: Container(
              width: size.width * 0.12,
              padding: const EdgeInsetsDirectional.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
              child: Image.network(
                product.image!,
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text(
              product.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textTheme.displayMedium,
            ),
            subtitle: Text(
              '\$ ${product.price}',
              style: textTheme.headlineSmall,
            ),
          ),
          Positioned(
            bottom: 8,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: IconButton.outlined(
                      padding: const EdgeInsets.all(0),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(AddToCart(product: product));
                      },
                      iconSize: 24,
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        final productState = state.products
                            .firstWhere((element) => element.id == product.id);

                        return Text(
                          '${productState.quantityInCart}',
                          style: textTheme.headlineSmall,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: IconButton.outlined(
                      padding: const EdgeInsets.all(0),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(ReduceInCart(product: product));
                      },
                      iconSize: 24,
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
