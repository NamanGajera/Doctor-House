// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProfileNotificationContainer extends StatelessWidget {
  ProfileNotificationContainer({
    super.key,
    required this.title,
    this.onChanged,
    this.val = false,
  });
  final String title;
  bool val;
  void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        const Spacer(),
        Switch(
          value: val,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
