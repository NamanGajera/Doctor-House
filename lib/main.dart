import 'package:dr_house/screens/auth/onBordingScreen/on_bording_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrHouse());
}

class DrHouse extends StatelessWidget {
  const DrHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBordingScreen(),
    );
  }
}
