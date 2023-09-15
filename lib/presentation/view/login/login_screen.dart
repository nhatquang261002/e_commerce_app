import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../config/const/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 148,
          ),
          Text(
            'Helo Again!',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Fill Your Details Or Continue With Social Media',
            maxLines: 2,
            style: textTheme.displayMedium!.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Password',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: passwordController,
                          obscureText: passwordHide,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Positioned(
                          height: 40,
                          bottom: 8,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordHide = !passwordHide;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Recovery Password',
                          style: textTheme.displaySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Button
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Theme.of(context).colorScheme.primary),
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<UserBloc>()
                              .add(const GetUser(email: 'a@gmail.com'));
                          context.read<UserBloc>().add(const Login());
                          context.go('/');
                        },
                        child: Text(
                          'Sign In',
                          style: textTheme.headlineSmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: surfaceColor),
                      child: TextButton(
                        onPressed: () {
                          context.read<UserBloc>().add(const Login());
                        },
                        style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Asset.google_icon),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Sign In With Google',
                              style: textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New User?',
                style: textTheme.displayMedium,
              ),
              GestureDetector(
                child: Text(
                  ' Create Account',
                  style: textTheme.displayMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
