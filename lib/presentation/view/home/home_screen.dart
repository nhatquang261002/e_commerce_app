import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app/config/const/assets.dart';
import 'package:e_commerce_app/config/const/fonts.dart';
import 'package:e_commerce_app/presentation/bloc/network_products_bloc/network_products_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/custom_nav_bar.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/category_button.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/item_tile.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/menu_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

Widget homeScreen(BuildContext context, TextEditingController searchController,
    ScrollController categoryScrollController) {
  // Colors
  // final primaryColor = Theme.of(context).colorScheme.primary;
  final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
  final surfaceColor = Theme.of(context).colorScheme.surface;
  final backgroundColor = Theme.of(context).colorScheme.background;

  var selectedIndex = 0;

  // Screen size
  final size = MediaQuery.of(context).size;

  // View
  return StatefulBuilder(builder: (context, setState) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // Custommized AppBar
      appBar: customAppBar(
          backgroundColor: surfaceColor,
          titleTextColor: inverseSurfaceColor,
          context: context),

      // Home Screen Body
      body: Container(
        color: surfaceColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 52,
                  width: size.width * 0.75,
                  child: Material(
                    borderRadius: BorderRadius.circular(14),
                    elevation: 1,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          hintText: 'Looking for shoes'),
                    ),
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {},
                  icon: SvgPicture.asset(Asset.sliders),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),

            // Select Category
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                'Select Category',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NetworkProductsBloc, NetworkProductsState>(
              builder: (context, state) {
                final categories = state.categories;

                return SizedBox(
                  height: 40,
                  child: state.categoriesFetched == true
                      ? ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          controller: categoryScrollController,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.read<NetworkProductsBloc>().add(
                                    CategoryProductsFetched(
                                        category: categories[index]));
                                selectedIndex = index;
                              },
                              child: CategoryButton(
                                category: categories[index],
                                isSelected:
                                    selectedIndex == index ? true : false,
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),

            // Popular row
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Items',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<NetworkProductsBloc, NetworkProductsState>(
              builder: (context, state) {
                if (state.status == NetworkStatus.success) {
                  final productsList = state.products;
                  return SizedBox(
                    height: size.height * 0.275,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        final prod = productsList[index];
                        return ItemTile(
                          product: prod,
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    height: size.height * 0.25,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),

            // New Arrival Row
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Arrival',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Banner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Banner...',
                    style: textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  });
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
      ): () => context.push('/profile')
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
      ): () {}
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
            'User name',
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
