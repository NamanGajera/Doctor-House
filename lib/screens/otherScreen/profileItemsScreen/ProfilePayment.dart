import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/size.dart';

class ProfilePayment extends StatelessWidget {
  const ProfilePayment({super.key});

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
            for (int i = 0; i < 5; i++)
              Card(
                surfaceTintColor: Colors.transparent,
                color: Ncolor.lightCream,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(Nlist.paymentMethodIcon[i],
                          ),
                          height: Nsize.screenheight * 0.07,
                          width: Nsize.screenheight * 0.07,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        Nlist.paymentMethodname[i],
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
