import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';

class ProfileHelpCenter extends StatelessWidget {
  const ProfileHelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ncolor.lightCream,
      appBar: AppBar(
        title: const Text('Notification'),
        elevation: 0,
        backgroundColor: Ncolor.lightCream,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ExpansionTile(
              title: Text(
                'What is Doctor House',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              childrenPadding: const EdgeInsets.only(left: 14, right: 5),
              children: [
                Text(
                  'This app provide booking of doctor appointments online. This app provides an effortless way of users to schedule their medical appointment.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text(
                'How to book an appointment?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              childrenPadding: const EdgeInsets.only(left: 14, right: 5),
              children: [
                Text(
                  'Go to the Home page -> Tap on any doctor or doctor speciality -> Tap on any doctor -> fill the relevent details -> Pay the booking fees',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text(
                'How to do i cancle my appointment?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              childrenPadding: const EdgeInsets.only(left: 14, right: 5),
              children: [
                Text(
                  'Go to the Scheduled page -> Tap on cancle button -> Tap on Yes button',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text(
                'What is mode of payment?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              childrenPadding: const EdgeInsets.only(left: 14, right: 5),
              children: [
                Text(
                  'We accept the payment through all UPI and all type of payment application',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
