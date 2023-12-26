import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Ncolor.lightCream,
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
