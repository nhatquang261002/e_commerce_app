// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String tileName;
  final Icon tileIcon;
  final VoidCallback onTap;
  const MenuTile({
    Key? key,
    required this.tileName,
    required this.tileIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: tileIcon,
        title: Text(
          tileName,
          style: textTheme.headlineSmall!.copyWith(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
