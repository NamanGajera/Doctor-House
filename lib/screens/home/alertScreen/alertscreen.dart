import 'package:dr_house/common/appbar/appbar.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:flutter/material.dart';
import '../../../utils/const/size.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Notification'),
        body: SizedBox(
          height: Nsize.screenheight,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              // SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const NotificationList();
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1.2,
                    );
                  },
                  itemCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Ncolor.lightCream,
            backgroundImage: AssetImage(Nimages.docProfile),
          ),
          SizedBox(width: 20),
          Text(
            'Dr. Shuhani Shah',
            style: TextStyle(fontSize: 18),
          ),
          Spacer(),
          Text(
            '10:00 AM',
            style: TextStyle(
              fontSize: 16,
              color: Ncolor.lightblacktext,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
