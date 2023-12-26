import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Ncolor.lightCream,
      body: Center(
        child: Text('ProfileScreen'),
      ),
    );
  }
}
