// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/config/const/assets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';

PreferredSizeWidget customAppBar(
    {required Color backgroundColor,
    required Color titleTextColor,
    required BuildContext context}) {
  return AppBar(
    backgroundColor: backgroundColor,

    // AppBar Title
    title: Stack(
      children: [
        Positioned(
            top: 1.0, left: 1.0, child: SvgPicture.asset(Asset.highlight_05)),
        Text(
          "  Explore  ",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: titleTextColor),
        ),
      ],
    ),
    centerTitle: true,

    // Drawer Button
    leading: IconButton(
        onPressed: () {
          if (ZoomDrawer.of(context)!.isOpen()) {
            ZoomDrawer.of(context)!.close();
          } else {
            ZoomDrawer.of(context)!.open();
          }
        },
        icon: const Icon(Icons.menu)),

    // Trailing Button
    actions: [
      IconButton(
        onPressed: () {
          context.push('/cart', extra: context.read<CartBloc>().state.products);
        },
        icon: badges.Badge(
            badgeContent: const Icon(
              Icons.circle,
              color: Colors.red,
              size: 3,
            ),
            showBadge:
                context.watch<CartBloc>().state.products.isEmpty ? false : true,
            child: const Icon(Icons.shopping_bag_outlined)),
      )
    ],
  );
}
