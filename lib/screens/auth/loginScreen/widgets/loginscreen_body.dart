import 'package:dr_house/controller/authsScreenController/LoginController/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/buttons/simplebutton.dart';
import '../../../../common/textfield/passwordTextField.dart';
import '../../../../common/textfield/textfield.dart';
import '../../../../utils/const/colors.dart';
import '../../../../utils/const/size.dart';
import '../../../../utils/const/text.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormkey,
      child: ElasticIn(
        animate: true,
        delay: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
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

            /// password
            Obx(
              () => PasswordTextField(
                bordercolor: Ncolor.darkblue1,
                controller: controller.passwordcontroller,
                labelText: Ntext.password,
                icon: Iconsax.lock_1,
                obscureText: controller.obscureText.value,
                onPressed: controller.showandHidePassword,
                validator: ValidationBuilder().minLength(6).required().build(),
              ),
            ),

            /// forgot password text
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Ncolor.darkblue1,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Nsize.spaceBetweenTextField * 2),

            /// login button
            Obx(
              () => SimpleButton(
                height: Nsize.screenheight * 0.05,
                width: Nsize.screenwidth,
                applyborderRadius: true,
                borderRadius: 15,
                applyboxShadow: false,
                buttonText: Ntext.login.toUpperCase(),
                applybold: true,
                backgroundColor: Ncolor.darkblue2,
                fontSize: 26,
                buttonTextColor: Colors.black,
                loading: controller.loading.value,
                onTap: () {
                  controller.logIn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
