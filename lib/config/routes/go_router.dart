import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/home_with_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/view/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/view/checkout/checkout_screen.dart';
import 'package:e_commerce_app/presentation/view/favourite/favourite_screen.dart';
import 'package:e_commerce_app/presentation/view/product_detail/product_detail_screen.dart';
import 'package:e_commerce_app/presentation/view/profile/edit_profile_screen.dart';
import 'package:e_commerce_app/presentation/view/profile/profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeWithMenu(),
    ),
    GoRoute(path: '/cart', builder: (context, state) => CartScreen(), routes: [
      GoRoute(
        path: 'checkout',
        builder: (context, state) => CheckoutScreen(
          cartTotal: state.extra as double,
        ),
      ),
    ]),
    GoRoute(
      path: '/details',
      builder: (context, state) => ProductDetailScreen(
        product: state.extra as ProductModel,
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        return ProfileScreen(user: state.extra as UserModel);
      },
      routes: [
        GoRoute(
            path: 'edit',
            builder: (context, state) {
              return EditProfileScreen(
                userBloc: state.extra as UserBloc,
              );
            }),
      ],
    ),
    GoRoute(
      path: '/favourite',
      builder: (context, state) => FavouriteScreen(),
    ),
  ],
);
