import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Ncolor.lightCream,
      body: Center(
        child: Text('AlertScreen'),
      ),
    );
  }
}
