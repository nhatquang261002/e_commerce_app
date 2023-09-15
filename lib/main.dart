import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/network_products_bloc/network_products_bloc.dart';
import 'config/const/color_schemes.g.dart';
import 'config/const/fonts.dart';
import 'config/routes/go_router.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkProductsBloc>(
          create: (_) => getIt<NetworkProductsBloc>()
            ..add(ProductsFetched())
            ..add(CategoriesFetched()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => getIt<CartBloc>()..add(CartProductsInit()),
        ),
        BlocProvider<FavouriteBloc>(
          create: (_) => getIt<FavouriteBloc>()..add(FavouriteProductsInit()),
        ),
        BlocProvider<UserBloc>(
          create: (_) => getIt<UserBloc>(),
        ),
      ],
      child: MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: textTheme,
        ),
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
