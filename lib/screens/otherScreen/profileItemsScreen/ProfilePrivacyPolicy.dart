import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePrivacyPolicy extends StatelessWidget {
  const ProfilePrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ncolor.lightCream,
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
      body: const SingleChildScrollView(
        physics:  BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'What we collect',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'When you are availing our services, you may provide one or more of the information given below\n  - Name\n  - Contact information including email address\n  - Any IDs required by the hospital or clinic you are booking appointment with',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Text(
                'What we do with the information we gather',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'We require this information to understand your needs and provide you with a the service that you opt for and in particular for the following reasons:'),
              SizedBox(height: 10),
              Text(
                  '  - Internal record keeping.\n  - We may use the information to improve services.\n  - We will never sell your information.'),
              SizedBox(height: 10),
              Text(
                'Security',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                textAlign: TextAlign.justify,
                ' We are committed to ensuring that your information is secure. In order to prevent unauthorized access or disclosure we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online',
              ),
              SizedBox(height: 10),
              Text(
                'How we use Cookies',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                textAlign: TextAlign.justify,
                'A cookie is a small file which asks permission to be placed on your computer\'s hard drive. Once you agree, the file is added and the cookie helps analyze web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.\nWe use traffic log cookies to identify which pages are being used. This helps us analyze data about web page traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system.',
              ),
              SizedBox(height: 10),
              Text(
                'Controlling your personal information',
                style: TextStyle(
                  color: Ncolor.darkblue1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You may choose to restrict the collection or use of your personal information in the following ways:',
              ),
              Text('We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen.')
            ],
          ),
        ),
      ),
    );
  }
}
