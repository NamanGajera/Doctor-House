// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    super.key,
    required this.leadingIcon,
    required this.itemText,
    this.tralingIcon,
    this.onTap,
  });

  final String itemText;
  final IconData leadingIcon;
  final IconData? tralingIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            size: 28,
          ),
          title: Text(
            itemText,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          trailing: Icon(
            tralingIcon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
