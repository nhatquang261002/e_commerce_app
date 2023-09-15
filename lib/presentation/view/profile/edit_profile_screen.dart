// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:e_commerce_app/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user.dart';

class EditProfileScreen extends StatefulWidget {
  final UserBloc userBloc;
  const EditProfileScreen({
    Key? key,
    required this.userBloc,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final locationController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    firstNameController.text = widget.userBloc.state.user.firstName ?? '';
    lastNameController.text = widget.userBloc.state.user.lastName ?? '';
    locationController.text = widget.userBloc.state.user.location ?? '';
    phoneNumberController.text = widget.userBloc.state.user.phoneNumber == null
        ? ''
        : widget.userBloc.state.user.phoneNumber.toString();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // text Theme
    final textTheme = Theme.of(context).textTheme;

    // colors
    final backgroundColor = Theme.of(context).colorScheme.background;
    final primaryColor = Theme.of(context).colorScheme.primary;

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
              final user = UserModel(
                email: 'a@gmail.com',
                password: widget.userBloc.state.user.password,
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                location: locationController.text,
                phoneNumber: phoneNumberController.text == ''
                    ? null
                    : int.parse(phoneNumberController.text),
              );

              context.read<UserBloc>().add(SaveUser(user: user));
            },
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Save',
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            const Center(
              child: CircleAvatar(
                radius: 60,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                'User name',
                style: textTheme.headlineSmall,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Change Profile Picture',
                  style: textTheme.displayMedium!
                      .copyWith(color: primaryColor, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // Scrollable textfields
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // First Name Textfield
                    Text(
                      'First Name',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: firstNameController,
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

                    // Last Name Textfield
                    Text(
                      'Last Name',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: lastNameController,
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

                    // Location Textfield
                    Text(
                      'Location',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: locationController,
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

                    // Phone Number Textfield
                    Text(
                      'Phone Number',
                      style: textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: phoneNumberController,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
