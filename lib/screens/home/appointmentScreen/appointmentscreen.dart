import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/controller/homeScreenController/homeScreen/appointmentScreenController.dart';
import 'package:dr_house/screens/home/appointmentScreen/historyScreen/histroyScreen.dart';
import 'package:dr_house/screens/home/appointmentScreen/scheduledScreen/scheduledScreen.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/schedule_history_button.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int index = 0;
  List apppointmentpages = [
    const ScheduledScreen(),
    const HistoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: Nappbar.appbar('Appointment'),
        backgroundColor: Ncolor.lightCream,
        body: SizedBox(
          height: Nsize.screenheight,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              /// Schedule And History Button
              const ScheduleHistoryButton(),

              /// Schedule And History Page
              Obx(
                () => Expanded(
                  child: apppointmentpages[controller.pageindex.value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
