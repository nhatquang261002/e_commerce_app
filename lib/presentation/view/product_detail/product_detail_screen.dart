// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/view/widgets/added_to_cart_dialog.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final backgroundColor = Theme.of(context).colorScheme.background;
    // final surfaceColor = Theme.of(context).colorScheme.surface;
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/cart');
            },
            icon: const badges.Badge(
                badgeContent: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 3,
                ),
                child: Icon(Icons.shopping_bag_outlined)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title!,
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.category!,
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '\$ ${product.price}',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Center(
                child: Image.network(product.image!),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: size.height * 0.15,
              child: SingleChildScrollView(
                child: ReadMoreText(
                  product.description!,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: textTheme.displayMedium,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(backgroundColor: backgroundColor),
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(size.width * 0.6, size.height * 0.05)),
                  onPressed: () {
                    context.read<CartBloc>().add(AddToCart(product: product));
                    addedToCartDialog(context, product);
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: backgroundColor,
                  ),
                  label: Text(
                    'Add To Cart',
                    style: textTheme.headlineSmall!
                        .copyWith(color: backgroundColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
