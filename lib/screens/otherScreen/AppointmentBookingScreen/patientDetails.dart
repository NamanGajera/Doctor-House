import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/common/buttons/simplebutton.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'widget/patientDetailsForm.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final fullname = TextEditingController();

    String? selectedValue;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Patient Details'),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top * 2.5,
            width: Nsize.screenwidth,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  PatientDetailForm(
                    fullname: fullname,
                    items: Nlist.genderList,
                    selectedValue: selectedValue,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: Nsize.screenheight * 0.025,
                    width: Nsize.screenwidth,
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.025,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: 'Next',
                      backgroundColor: Ncolor.darkblue2,
                      fontSize: 22,
                      loading: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
