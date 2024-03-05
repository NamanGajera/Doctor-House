// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/helper/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/dialog/showMyDialog.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/text.dart';
import '../appointmentCard/appointment_card.dart';
import '../appointmentCard/widget/allow_notification.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final appointmentStream = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .collection('AppointmentDetails')
        .snapshots();
    return Scaffold(
      backgroundColor: Ncolor.lightCream,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const AllowNotification(),
            const Divider(
              thickness: 1.2,
            ),
            StreamBuilder(
              stream: appointmentStream,
              builder: (context, snapshot) {
                int streamLength = snapshot.data?.docs.length ?? 0;
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: streamLength,
                    itemBuilder: (context, index) {
                      String date = snapshot.data?.docs[index]['date'] ?? '';
                      String time = snapshot.data?.docs[index]['time'] ?? '';
                      String docName =
                          snapshot.data?.docs[index]['docName'] ?? '';
                      String docCity =
                          snapshot.data?.docs[index]['docCity'] ?? '';
                      String bookinID = snapshot.data?.docs[index]['id'] ?? '';

                      return AppointmentCard(
                        dateTimeText: '$date - $time',
                        docName: docName,
                        docCity: docCity,
                        docImage: Nimages.docProfile,
                        bookingId: '#$bookinID',
                        canclebtn: true,
                        onTap: () {
                          NmyDialog.showCongratulationDialog(
                            Nimages.appointment,
                            Ntext.cancleText,
                            Ntext.canclesubText,
                            'Yes',
                            'No',
                            () {
                              Future.delayed(const Duration(seconds: 1), () {
                                FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(user.uid)
                                    .collection('AppointmentDetails')
                                    .doc(bookinID)
                                    .delete()
                                    .then(
                                  (value) {
                                    Get.back();
                                    Nhelper.showSnackbar(
                                      title: 'Successfully',
                                      message: 'Cancle Appointment',
                                      duration: 1,
                                      backgroundColor: Ncolor.darkblue3,
                                      colorText: Colors.black,
                                    );
                                  },
                                ).onError(
                                  (error, stackTrace) => Nhelper.errorSnackBar(
                                    title: 'Error',
                                    message: error.hashCode.toString(),
                                  ),
                                );
                              });
                            },
                            () {
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
