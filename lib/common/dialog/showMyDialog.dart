import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/const/colors.dart';
import '../../utils/const/size.dart';
import '../buttons/simplebutton.dart';

class NmyDialog {
  static void showCongratulationDialog(
    String iconImg,
    String headingText,
    String subText,
    String firstbuttonText,
    String secondbuttonText,
    dynamic Function() firstBtnOnTap,
    dynamic Function() secondBtnOnTap,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Ncolor.lightCream,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          contentPadding: const EdgeInsets.all(12),
          content: SizedBox(
            height: Nsize.screenheight * 0.32,
            width: Nsize.screenwidth * 0.2,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: Nsize.screenheight * 0.08,
                  width: Nsize.screenheight * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Ncolor.darkblue3,
                  ),
                  child: Image(
                    image: AssetImage(iconImg),
                    color: Colors.white,
                    fit: BoxFit.cover,
                    height: Nsize.screenheight * 0.05,
                    width: Nsize.screenheight * 0.05,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  headingText,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Ncolor.darkblue2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),

                /// First Button
                SizedBox(
                  height: Nsize.screenheight * 0.052,
                  width: Nsize.screenwidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.05,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: firstbuttonText,
                      backgroundColor: Ncolor.darkblue3,
                      fontSize: 18,
                      loading: false,
                      onTap: firstBtnOnTap,
                    ),
                  ),
                ),
                const SizedBox(height: 5),

                /// Second Button
                SizedBox(
                  height: Nsize.screenheight * 0.052,
                  width: Nsize.screenwidth,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12, left: 12, bottom: 8),
                    child: SimpleButton(
                      height: Nsize.screenheight * 0.05,
                      width: Nsize.screenwidth,
                      applyborderRadius: true,
                      borderRadius: 24,
                      applyboxShadow: false,
                      applybold: true,
                      buttonText: secondbuttonText,
                      backgroundColor: Ncolor.lightCream,
                      fontSize: 18,
                      loading: false,
                      onTap: secondBtnOnTap,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
