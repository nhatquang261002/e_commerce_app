// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final double cartTotal;
  const CheckoutScreen({
    Key? key,
    required this.cartTotal,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
// Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    final primaryColor = Theme.of(context).colorScheme.primary;
    // final inverseSurfaceColor = Theme.of(context).colorScheme.inverseSurface;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    // final backgroundColor = Theme.of(context).colorScheme.background;

    // TextTheme
    final textTheme = Theme.of(context).textTheme;

    // size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 40, 14, 0),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact information
                Text(
                  'Contact information',
                  style: textTheme.displayMedium,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone_outlined),
                    hintText: 'Phone',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                // Address
                Text(
                  'Address',
                  style: textTheme.displayMedium,
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    border: InputBorder.none,
                  ),
                ),
                Center(
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: surfaceColor),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                // payment
                Text(
                  'Payment Method',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  children: [
                    Icon(Icons.payment_outlined),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('ABCD Bank'), Text('**** 4567 8910')],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Fee Column
          Container(
            color: Colors.white,
            height: size.height * 0.3,
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: textTheme.displayMedium!
                          .copyWith(color: Colors.grey[500]),
                    ),
                    Text(
                      '\$ ${widget.cartTotal.toStringAsFixed(2)}',
                      style: textTheme.headlineSmall,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: textTheme.displayMedium!
                          .copyWith(color: Colors.grey[500]),
                    ),
                    Text(
                      '\$ ${widget.cartTotal.toStringAsFixed(2)}',
                      style: textTheme.headlineSmall,
                    )
                  ],
                ),
                Divider(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: textTheme.headlineSmall,
                    ),
                    Text(
                      '\$ ${(widget.cartTotal * 2).toStringAsFixed(2)}',
                      style: textTheme.headlineSmall!
                          .copyWith(color: primaryColor),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: primaryColor),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(),
                    child: Text(
                      'Checkout',
                      style: textTheme.headlineSmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
