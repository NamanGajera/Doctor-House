import 'package:dr_house/controller/homeScreenController/homeScreen/appointmentScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';

class ScheduleHistoryButton extends StatelessWidget {
  const ScheduleHistoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentScreenController());
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          /// Schedule Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.pageindex.value = 0;
              },
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  height: Nsize.screenheight * 0.055,
                  decoration: BoxDecoration(
                    color: (controller.pageindex.value == 0)
                        ? Ncolor.darkblue2
                        : Ncolor.lightCream,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Scheduled',
                    style: TextStyle(
                      color: (controller.pageindex.value == 0)
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),

          /// History Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.pageindex.value = 1;
              },
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  height: Nsize.screenheight * 0.055,
                  decoration: BoxDecoration(
                    color: (controller.pageindex.value == 1)
                        ? Ncolor.darkblue2
                        : Ncolor.lightCream,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'History',
                    style: TextStyle(
                      color: (controller.pageindex.value == 1)
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
