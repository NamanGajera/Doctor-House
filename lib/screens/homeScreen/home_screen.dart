import 'package:doctor_house/core/constants/app_constants.dart';
import 'package:doctor_house/core/constants/images.dart';
import 'package:doctor_house/core/constants/widgets.dart';
import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey $userName!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        'Explore doctors by specialty and book your next visit now.',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Color(0xffededff), borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          searchIcon,
                          height: 23,
                          width: 23,
                        ),),
                    const SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Color(0xffededff), borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        notificationIcon,
                        height: 23,
                        width: 23,
                      ),),
                  ],
                ).withPadding(const EdgeInsets.only(top: 3)),
                const SizedBox(width: 5),
              ],
            ),
          ],
        ).withPadding(EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
      ),
    );
  }
}
