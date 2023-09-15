import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/home_with_menu.dart';
import 'package:e_commerce_app/presentation/view/login/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/view/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/view/checkout/checkout_screen.dart';
import 'package:e_commerce_app/presentation/view/favourite/favourite_screen.dart';
import 'package:e_commerce_app/presentation/view/product_detail/product_detail_screen.dart';
import 'package:e_commerce_app/presentation/view/profile/edit_profile_screen.dart';
import 'package:e_commerce_app/presentation/view/profile/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // Home Screen
    GoRoute(
        path: '/',
        builder: (context, state) => const HomeWithMenu(),
        routes: [
          // Cart screen
          GoRoute(
            path: 'cart',
            builder: (context, state) => const CartScreen(),
            routes: [
              // Checkout
              GoRoute(
                path: 'checkout',
                builder: (context, state) => CheckoutScreen(
                  cartTotal: state.extra as double,
                ),
              ),
            ],
          ),

          // Details screen
          GoRoute(
            path: 'details',
            builder: (context, state) => ProductDetailScreen(
              product: state.extra as ProductModel,
            ),
          ),

          // Profile Screen
          GoRoute(
            path: 'profile',
            builder: (context, state) {
              return ProfileScreen(user: state.extra as UserModel);
            },
            routes: [
              // Edit Profile
              GoRoute(
                  path: 'edit',
                  builder: (context, state) {
                    return EditProfileScreen(
                      userBloc: state.extra as UserBloc,
                    );
                  }),
            ],
          ),

          // Fav Screen
          GoRoute(
            path: 'favourite',
            builder: (context, state) => const FavouriteScreen(),
          ),
        ]),
  ],
);
