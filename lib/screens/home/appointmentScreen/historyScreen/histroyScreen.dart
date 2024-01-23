// ignore_for_file: file_names

import '../../../../utils/const/colors.dart';
import 'package:flutter/material.dart';
import '../../../../utils/const/images.dart';
import '../appointmentCard/appointment_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Ncolor.lightCream,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            AppointmentCard(
              dateTimeText: 'Jan 21, 2024 - 10:00 AM',
              docName: 'Dr. Rupali Gajjar',
              docCity: 'Ahemdabad',
              docImage: Nimages.docProfile,
              bookingId: '#1254789630',
              canclebtn: false,
            ),
            SizedBox(height: 10),
            AppointmentCard(
              dateTimeText: 'Jan 22, 2024 - 05:00 PM',
              docName: 'Dr. Naman Gajjar',
              docCity: 'Surat',
              docImage: Nimages.docProfile,
              bookingId: '#1584542630',
              canclebtn: false,
            ),
          ],
        ),
      ),
    );
  }
}
