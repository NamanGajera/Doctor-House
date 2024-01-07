import 'package:dr_house/utils/const/colors.dart';
import 'package:dr_house/utils/const/images.dart';
import 'package:dr_house/utils/const/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/buttons/simplebutton.dart';
import 'widgets/docDetail_appbar.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: DocDetailsAppBar.appbar(),
        body: SizedBox(
          height: Nsize.screenheight - MediaQuery.of(context).padding.top,
          width: Nsize.screenwidth,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image(
                              image: const AssetImage(Nimages.docProfile),
                              height: Nsize.screenheight * 0.11,
                              width: Nsize.screenheight * 0.07,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Dr. Anerrrssssssi Shuhani',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'General Doctor',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Ncolor.lightblacktext,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.location,
                                      size: 20,
                                    ),
                                    Text(
                                      'Ahemdabad',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Ncolor.lightblacktext,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text('Doctor'),
                  ],
                ),
              ),

              /// Booking Button
              SizedBox(
                height: Nsize.screenheight * 0.025,
                width: Nsize.screenwidth,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                  child: SimpleButton(
                    height: Nsize.screenheight * 0.025,
                    width: Nsize.screenwidth,
                    applyborderRadius: true,
                    borderRadius: 24,
                    applyboxShadow: false,
                    applybold: true,
                    buttonText: 'Book Appointment',
                    backgroundColor: Ncolor.darkblue2,
                    fontSize: 22,
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
