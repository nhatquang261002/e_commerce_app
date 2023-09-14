// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;

  @override
  void initState() {
    nameController.text =
        '${widget.user.firstName ?? ''}${widget.user.lastName ?? ''}';
    emailController.text = widget.user.email;
    passwordController.text = widget.user.password;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme
    final textTheme = Theme.of(context).textTheme;
    // Size
    final size = MediaQuery.of(context).size;
    // Color
    final backgroundColor = Theme.of(context).colorScheme.background;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        nameController.text =
            '${state.user.firstName ?? ''}${state.user.lastName ?? ''}';
        emailController.text = state.user.email;
        passwordController.text = state.user.password;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Profile',
              style: textTheme.headlineSmall,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  final bloc = context.read<UserBloc>();

                  context.push('/profile/edit', extra: bloc);
                },
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Edit Profile',
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  const Center(
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Name Textfield
                  Text(
                    'Your Name',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Email Textfield
                  Text(
                    'Email Address',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Password Textfield
                  Text(
                    'Password',
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: passwordHide,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordHide = !passwordHide;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  // Reset password Textbutton
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
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Save Button
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
                          final UserModel user = UserModel(
                              firstName: widget.user.firstName,
                              lastName: widget.user.lastName,
                              location: widget.user.location,
                              phoneNumber: widget.user.phoneNumber,
                              email: widget.user.email,
                              password: widget.user.password);
                          context.read<UserBloc>().add(SaveUser(user: user));
                        },
                        style: TextButton.styleFrom(),
                        child: Text(
                          'Save',
                          style: textTheme.headlineSmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
