// ignore_for_file: file_names

import 'package:dr_house/screens/auth/signupScreen/signupScreen.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../screens/auth/onBordingScreen/widget/OnBordingPage.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/size.dart';
import '../../../utils/const/text.dart';

class OnBordingController extends GetxController {
  RxInt dotCurrentIndex = 0.obs;
  RxBool loading = false.obs;
  final pages = [
    /// Page 1
    OnBordingPage(
      backgroundColor: Ncolor.lightCream,
      height: Nsize.screenheight * 0.55,
      width: Nsize.screenwidth,
      image: Nimages.onbordingImg1,
      headline: Ntext.onbordingScreen1headline,
      subHedline: Ntext.onbordingScreen1Subheadline,
      pageText: Ntext.onbordingScreen1BottomText,
      islastpage: false,
    ),

    /// Page 2
    OnBordingPage(
      backgroundColor: Ncolor.coolgreen,
      height: Nsize.screenheight * 0.55,
      width: Nsize.screenwidth,
      image: Nimages.onbordingImg2,
      headline: Ntext.onbordingScreen2headline,
      subHedline: Ntext.onbordingScreen2Subheadline,
      pageText: Ntext.onbordingScreen2BottomText,
      islastpage: false,
    ),

    /// Page 3
    OnBordingPage(
      backgroundColor: Ncolor.lighttomato,
      height: Nsize.screenheight * 0.45,
      width: Nsize.screenwidth,
      image: Nimages.appIcon,
      headline: Ntext.onbordingscreen3Headline,
      subHedline: Ntext.onbordingscreen3SubHeadline,
      pageText: Ntext.onbordingScreen3BottomText,
      islastpage: true,
    ),
  ];

  final liquidController = LiquidController();

  onPageChangeCallback(activePageIndex) {
    dotCurrentIndex.value = activePageIndex;
  }

  onbordpageSkip() {
    liquidController.jumpToPage(page: 2);
  }

  openSignUpScreen() {
    loading.value = true;
    final deviceStorage = GetStorage();
    deviceStorage.write('isFirstTime', false);
    Get.offAll(() => const SignUpScreen());
    loading.value = false;
  }
}
