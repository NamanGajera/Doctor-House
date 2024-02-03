// ignore_for_file: must_be_immutable

import 'package:dr_house/controller/authsScreenController/SignUpController/singupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../common/buttons/simplebutton.dart';
import '../../../../common/textfield/textfield.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/const/text.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormkey,
      child: ElasticIn(
        animate: true,
        delay: const Duration(milliseconds: 600),
        duration: const Duration(milliseconds: 600),
        child: Column(
          children: [
            /// username
            NtextField(
              bordercolor: Ncolor.darkblue1,
              controller: controller.usernamecontroller,
              labelText: Ntext.username,
              icon: Iconsax.user_octagon,
              validator: ValidationBuilder().required().build(),
            ),
            const SizedBox(height: Nsize.spaceBetweenTextField),

            /// email
            NtextField(
              bordercolor: Ncolor.darkblue1,
              controller: controller.emailcontroller,
              labelText: Ntext.email,
              icon: Icons.email_outlined,
              validator: ValidationBuilder().required().email().build(),
            ),

            const SizedBox(height: Nsize.spaceBetweenTextField),

            /// phone
            NtextField(
              bordercolor: Ncolor.darkblue1,
              controller: controller.phonecontroller,
              labelText: Ntext.phone,
              icon: Iconsax.call,
              keybordtype: TextInputType.phone,
              validator: ValidationBuilder().required().phone().build(),
            ),
            const SizedBox(height: Nsize.spaceBetweenTextField),

            /// password
            NtextField(
              bordercolor: Ncolor.darkblue1,
              controller: controller.passwordcontroller,
              labelText: Ntext.password,
              icon: Iconsax.lock_1,
              validator: ValidationBuilder().required().minLength(6).build(),
            ),
            const SizedBox(height: Nsize.spaceBetweenTextField),

            /// confirm password
            NtextField(
              bordercolor: Ncolor.darkblue1,
              controller: controller.confpasscontroller,
              labelText: Ntext.confpassword,
              icon: Iconsax.lock_1,
              validator: ValidationBuilder().required().minLength(6).build(),
            ),
            const SizedBox(height: Nsize.spaceBetweenTextField * 3),

            /// Sign Up button
            Obx(
              () => SimpleButton(
                height: Nsize.screenheight * 0.05,
                width: Nsize.screenwidth,
                applyborderRadius: true,
                borderRadius: 15,
                applyboxShadow: false,
                buttonText: Ntext.signup.toUpperCase(),
                applybold: true,
                backgroundColor: Ncolor.darkblue2,
                fontSize: 26,
                buttonTextColor: Colors.black,
                loading: controller.loading.value,
                onTap: () {
                  controller.sigup();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
