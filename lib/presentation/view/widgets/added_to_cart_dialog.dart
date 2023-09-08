import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';

addedToCartDialog(BuildContext context, ProductModel product) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Added to cart',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Confirm',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary),
                )),
            TextButton(
              onPressed: () {
                context.read<CartBloc>().add(DeleteFromCart(product));
                Navigator.pop(context);
              },
              child: Text(
                'Undo',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        );
      });
}
