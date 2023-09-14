import 'package:e_commerce_app/presentation/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/config/const/fonts.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/menu_tile.dart';

import '../../bloc/user_bloc/user_bloc.dart';

class HomeWithMenu extends StatefulWidget {
  const HomeWithMenu({Key? key}) : super(key: key);

  @override
  State<HomeWithMenu> createState() => _HomeWithMenuState();
}

class _HomeWithMenuState extends State<HomeWithMenu> {
  // controllers
  final ScrollController _categoryScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
  int currentNavigationIndex = 3;
  var selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // View
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuBackgroundColor: Theme.of(context).colorScheme.primary,
      mainScreen:
          homeScreen(context, _searchController, _categoryScrollController),
      menuScreen: menuScreen(context),
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
    );
  }
}

Widget menuScreen(BuildContext context) {
  // Colors
  final primaryColor = Theme.of(context).colorScheme.primary;
  // final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
  // final surfaceColor = Theme.of(context).colorScheme.surface;
  // final backgroundColor = Theme.of(context).colorScheme.background;
  Map<String, Map<Icon, VoidCallback>> menu = {
    'Profile': {
      const Icon(
        Icons.person_outline,
        color: Colors.white,
      ): () {
        final bloc = context.read<UserBloc>().state.user;
        context.push('/profile', extra: bloc);
      }
    },
    'My Cart': {
      const Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ): () => context.push('/cart')
    },
    'Favorite': {
      const Icon(
        Icons.favorite_border_outlined,
        color: Colors.white,
      ): () => context.push('/cart')
    },
    'Orders': {
      const Icon(
        Icons.local_shipping_outlined,
        color: Colors.white,
      ): () {}
    },
    'Notifications': {
      const Icon(
        Icons.notifications_outlined,
        color: Colors.white,
      ): () {}
    },
    'Settings': {
      const Icon(
        Icons.settings_outlined,
        color: Colors.white,
      ): () {}
    },
    'Sign out': {
      const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ): () {}
    }
  };

  // textTheme
  final menuTextTheme = Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);
  return Scaffold(
    backgroundColor: primaryColor,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 35,
          ),
          Text(
            context.watch<UserBloc>().state.user.lastName!,
            style: menuTextTheme.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 35,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length - 1,
            itemBuilder: (context, index) {
              return MenuTile(
                  tileName: menu.keys.elementAt(index),
                  tileIcon: menu.values.elementAt(index).keys.first,
                  onTap: menu.values.elementAt(index).values.first);
            },
          ),
          const Divider(),
          ListTile(
            leading: menu.values.last.keys.first,
            title: Text(
              menu.keys.last,
              style: textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ),
  );
}
