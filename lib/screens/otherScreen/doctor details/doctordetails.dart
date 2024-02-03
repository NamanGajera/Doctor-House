import 'package:dr_house/controller/otherScreenController/booking_controller.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/buttons/simplebutton.dart';
import 'doc_details_body.dart';
import 'doc_details_header.dart';
import 'widgets/docDetail_appbar.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({
    super.key,
    required this.docname,
    required this.doctype,
    required this.doccity,
    required this.docdegree,
    required this.docdescription,
    required this.id,
  });

  final String docname;
  final String doctype;
  final String doccity;
  final String docdegree;
  final String docdescription;
  final String id;
  @override
  Widget build(BuildContext context) {
    final bookingcontroller = Get.put(BookingController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: DocDetailsAppBar.appbar(id),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      /// Doctor Details: photo, name, city etc.
                      DocDetailsHeader(
                        docname: docname,
                        doctype: doctype,
                        doccity: doccity,
                        docdegree: docdegree,
                      ),
                      const SizedBox(height: 10),

                      /// Doctor Details: description, working hours
                      DocDetailsBody(docdescription: docdescription),
                    ],
                  ),
                ),
              ),

              /// Booking Button
              SizedBox(
                height: Nsize.screenheight * 0.06,
                width: Nsize.screenwidth,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                  child: SimpleButton(
                    height: Nsize.screenheight * 0.06,
                    width: Nsize.screenwidth,
                    applyborderRadius: true,
                    borderRadius: 24,
                    applyboxShadow: false,
                    applybold: true,
                    buttonText: 'Book Appointment',
                    backgroundColor: Ncolor.darkblue2,
                    fontSize: 22,
                    loading: false,
                    onTap: () {
                      bookingcontroller.openBookAppointment();
                      bookingcontroller.doctorName = docname;
                      bookingcontroller.doctorType = doctype;
                      bookingcontroller.doctorCity = doccity;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
