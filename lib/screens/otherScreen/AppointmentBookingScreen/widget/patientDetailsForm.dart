// ignore_for_file: file_names

import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/list.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/helper/function.dart';

class PatientDetailForm extends StatelessWidget {
  const PatientDetailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    return Form(
      key: controller.patientFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Full Name
          const Text(
            'Full Name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.fullnamecontroller,
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Enter Full Patient Name',
            ),
            onTapOutside: Nhelper.hideKeybord,
            validator: ValidationBuilder().required().build(),
          ),
          const SizedBox(height: 10),

          /// Gender
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: Nsize.screenheight * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Ncolor.darkblue1),
                borderRadius: BorderRadius.circular(26)),
            child: Obx(
              () => DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    controller.gender.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: Nlist.genderList
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: controller.gender.value,
                  onChanged: (value) {
                    controller.gender.value = value!;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// Age
          const Text(
            'Your Age',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.ageController,
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Enter Your Age',
            ),
            onTapOutside: Nhelper.hideKeybord,
            keyboardType: TextInputType.number,
            validator: ValidationBuilder().required().build(),
          ),
          const SizedBox(height: 10),

          /// Write Your Problem
          const Text(
            'Write Your Problem',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 10,
            controller: controller.problemController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              labelStyle: const TextStyle(
                color: Ncolor.darkblue1,
                fontSize: Nsize.labletextfont,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(
                  color: Ncolor.darkblue1,
                ),
              ),
              hintText: '  Write Your Problem',
            ),
            onTapOutside: Nhelper.hideKeybord,
            // validator: validator,
          ),
        ],
      ),
    );
  }
}
