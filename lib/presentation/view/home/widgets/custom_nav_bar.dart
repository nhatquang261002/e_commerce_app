import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/presentation/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Colors
    final primaryColor = Theme.of(context).colorScheme.primary;
    // final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final backgroundColor = Theme.of(context).colorScheme.background;

    // size
    final size = MediaQuery.of(context).size;

    return Container(
      color: surfaceColor,
      height: size.height * 0.12,
      width: size.width,
      child: Stack(
        children: [
          CustomPaint(
            painter: NavBarCanvas(),
            child: SizedBox(
              height: size.height * 0.12,
              width: size.width,
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                context.push('/cart');
              },
              backgroundColor: primaryColor,
              elevation: 5,
              child: Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: backgroundColor,
                  weight: 0.2,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  isSelected: true,
                  onPressed: () {},
                  selectedIcon: Icon(
                    Icons.home_outlined,
                    color: primaryColor,
                  ),
                  icon: const Icon(Icons.home_outlined),
                ),
                IconButton(
                  isSelected: false,
                  onPressed: () {
                    context.push('/favourite',
                        extra: context.read<FavouriteBloc>());
                  },
                  selectedIcon: Icon(
                    Icons.favorite_border_outlined,
                    color: primaryColor,
                  ),
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
                const SizedBox(),
                const SizedBox(),
                IconButton(
                  isSelected: false,
                  onPressed: () {},
                  selectedIcon: Icon(
                    Icons.notifications_outlined,
                    color: primaryColor,
                  ),
                  icon: const Icon(Icons.notifications_outlined),
                ),
                IconButton(
                  isSelected: false,
                  onPressed: () {
                    final bloc = context.read<UserBloc>().state.user;
                    context.push('/profile', extra: bloc);
                  },
                  selectedIcon: Icon(
                    Icons.person_outline,
                    color: primaryColor,
                  ),
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavBarCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()..moveTo(0, 0);

    path.quadraticBezierTo(size.width / 16, 35, size.width / 3, 35);

    path.quadraticBezierTo(size.width / 2.5, 35, size.width / 2.5, 70);

    path.quadraticBezierTo(size.width / 2.5, 100, size.width / 2, 100);

    path.quadraticBezierTo(
        size.width - size.width / 2.5, 100, size.width - size.width / 2.5, 70);

    path.quadraticBezierTo(
        size.width - size.width / 2.5, 35, size.width - size.width / 3, 35);

    path.quadraticBezierTo(size.width - size.width / 16, 35, size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawShadow(path, const Color(0xFFF8FDFF), 5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
