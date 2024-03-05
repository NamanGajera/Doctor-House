// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/const/colors.dart';
import 'package:flutter/material.dart';
import '../../../../utils/const/images.dart';
import '../appointmentCard/appointment_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
        child: StreamBuilder(
          stream: appointmentStream,
          builder: (context, snapshot) {
            int streamLength = snapshot.data?.docs.length ?? 0;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: streamLength,
              itemBuilder: (context, index) {
                String date = snapshot.data?.docs[index]['date'] ?? '';
                String time = snapshot.data?.docs[index]['time'] ?? '';
                String docName = snapshot.data?.docs[index]['docName'] ?? '';
                String docCity = snapshot.data?.docs[index]['docCity'] ?? '';
                String bookinID = snapshot.data?.docs[index]['id'] ?? '';

                return AppointmentCard(
                  dateTimeText: '$date - $time',
                  docName: docName,
                  docCity: docCity,
                  docImage: Nimages.docProfile,
                  bookingId: '#$bookinID',
                  canclebtn: false,
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
