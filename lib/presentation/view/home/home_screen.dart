import 'package:e_commerce_app/data/models/product.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app/config/const/assets.dart';
import 'package:e_commerce_app/config/const/fonts.dart';
import 'package:e_commerce_app/presentation/bloc/network_products_bloc/network_products_bloc.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/category_button.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/presentation/view/home/widgets/item_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // controllers
  final searchController = TextEditingController();
  final scrollController = ScrollController();
  final categoryScrollController = ScrollController();

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    // final primaryColor = Theme.of(context).colorScheme.primary;
    final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final backgroundColor = Theme.of(context).colorScheme.background;

    var selectedIndex = 0;

    // Screen size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,

      // Custommized AppBar
      appBar: customAppBar(
          backgroundColor: surfaceColor,
          titleTextColor: inverseSurfaceColor,
          context: context),

      // Cusom nav bar
      bottomNavigationBar: const CustomNavBar(),

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
              builder: (context, productsState) {
                if (productsState.status == NetworkStatus.success) {
                  List<ProductModel> productsList = productsState.products;
                  var favProds = context.read<FavouriteBloc>().state.favourites;
                  for (var fav in favProds) {
                    productsList[fav.id! - 1] = fav;
                  }
                  return SizedBox(
                    height: size.height * 0.275,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        var prod = productsList[index];
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
    );
  }
}
