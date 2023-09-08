// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/config/const/fonts.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Colors
    final primaryColor = Theme.of(context).colorScheme.primary;
    // final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
    final backgroundColor = Theme.of(context).colorScheme.background;
    final surfaceColor = Theme.of(context).colorScheme.surface;

    // Screen size
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        var cartProducts = state.products;
        double cartTotal = 0;
        for (var e in cartProducts) {
          cartTotal += e.price!.toDouble();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My Cart',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
          ),
          body: Container(
            color: surfaceColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListView items
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    '${cartProducts.length} items',
                    style: textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: size.height * 0.4,
                    child: ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.2,
                              children: [
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: primaryColor,
                                //     borderRadius: BorderRadius.circular(12),
                                //   ),
                                //   child: Column(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       IconButton(
                                //           onPressed: () {},
                                //           icon: Icon(Icons.add)),
                                //       Text('1'),
                                //       IconButton(
                                //           onPressed: () {},
                                //           icon: Icon(Icons.remove)),
                                //     ],
                                //   ),
                                // )
                                SlidableAction(
                                  onPressed: (_) {
                                    context.read<CartBloc>().add(AddToCart(
                                        product: cartProducts[index]));
                                  },
                                  borderRadius: BorderRadius.circular(12.0),
                                  backgroundColor: primaryColor,
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.2,
                              children: [
                                SlidableAction(
                                  onPressed: (_) {
                                    context.read<CartBloc>().add(
                                        DeleteFromCart(cartProducts[index]));
                                  },
                                  borderRadius: BorderRadius.circular(12.0),
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete_outline,
                                )
                              ],
                            ),
                            child: SizedBox(
                              height: size.height * 0.1,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                tileColor: Colors.white,
                                leading: Container(
                                  width: size.width * 0.1,
                                  padding: const EdgeInsetsDirectional.all(8.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Image.network(
                                    cartProducts[index].image!,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                title: Text(
                                  cartProducts[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textTheme.displayMedium,
                                ),
                                subtitle: Text(
                                  '\$ ${state.products[index].price}',
                                  style: textTheme.headlineSmall,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Spacer(),

                // Fee Column
                Container(
                  color: Colors.white,
                  height: size.height * 0.3,
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: textTheme.displayMedium!
                                .copyWith(color: Colors.grey[500]),
                          ),
                          Text(
                            '\$ ${cartTotal.toStringAsFixed(2)}',
                            style: textTheme.headlineSmall,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: textTheme.displayMedium!
                                .copyWith(color: Colors.grey[500]),
                          ),
                          Text(
                            '\$ ${cartTotal.toStringAsFixed(2)}',
                            style: textTheme.headlineSmall,
                          )
                        ],
                      ),
                      Divider(
                        height: size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: textTheme.headlineSmall,
                          ),
                          Text(
                            '\$ ${(cartTotal * 2).toStringAsFixed(2)}',
                            style: textTheme.headlineSmall!
                                .copyWith(color: primaryColor),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 50,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: primaryColor),
                        child: TextButton(
                          onPressed: () {
                            if (cartTotal == 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                        content: Text(
                                            'There is no item in your cartProducts!'),
                                      ));
                            } else {
                              context.push('/cart/checkout', extra: cartTotal);
                            }
                          },
                          style: TextButton.styleFrom(),
                          child: Text(
                            'Checkout',
                            style: textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: backgroundColor,
        );
      },
    );
  }
}
