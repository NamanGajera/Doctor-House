import 'package:dr_house/controller/homeScreenController/homeScreen/appointmentScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/const/colors.dart';
import '../../../../../utils/const/size.dart';

class AllowNotification extends StatelessWidget {
  const AllowNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentScreenController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Allow Notification',
          style: TextStyle(
            color: Ncolor.lightblacktext,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: Nsize.screenheight * 0.04,
          width: Nsize.screenwidth * 0.1,
          child: Obx(
            () => Switch(
              value: controller.switchvalue.value,
              onChanged: (value) {
                controller.changeSwitchValue(value);
              },
              activeColor: Ncolor.darkblue2,
              inactiveThumbColor: Ncolor.darkblue2,
            ),
          ),
        ),
      ],
    );
  }
}
