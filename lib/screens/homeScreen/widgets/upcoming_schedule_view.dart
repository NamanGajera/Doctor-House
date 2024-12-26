import 'package:flutter/material.dart';

import '../../../core/constants/images.dart';

class UpcomingScheduleView extends StatefulWidget {
  const UpcomingScheduleView({super.key});

  @override
  State<UpcomingScheduleView> createState() => _UpcomingScheduleViewState();
}

class _UpcomingScheduleViewState extends State<UpcomingScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xff0165fc),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  doctorProfileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
