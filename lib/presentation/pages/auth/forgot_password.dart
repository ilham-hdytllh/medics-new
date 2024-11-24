import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/presentation/getx/auth/forgot_password_controller.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/utils/validators/validation.dart';
import 'widgets/auth_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordController = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(), child: Icon(IconlyLight.arrowLeft)),
      ),
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpacePadding),
        child: SingleChildScrollView(
          child: Form(
            key: forgotPasswordController.forgotKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo app, title, sub title
                AuthHeader(
                  title: "Reset Password",
                  subTitle:
                      "Silahkan masukkan email terdaftar untuk reset password",
                ),
                const SizedBox(
                  height: CustomSizes.spaceBtwInputFields,
                ),
                // Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  validator: (value) => CustomValidator.validateEmail(value),
                  controller: forgotPasswordController.email.value,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: "Email"),
                ),

                const SizedBox(
                  height: CustomSizes.spaceBtwSections,
                ),

                // Create Account Button
                Obx(() => SizedBox(
                      height: CustomSizes.inputFieldHeight,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          forgotPasswordController.isLoading.value == false
                              ? await forgotPasswordController.forgotPassword()
                              : null;
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          disabledBackgroundColor: CustomColors.grey,
                          disabledForegroundColor: CustomColors.primary,
                          foregroundColor: CustomColors.white,
                          backgroundColor: CustomColors.primary,
                        ),
                        child: forgotPasswordController.isLoading.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: CustomColors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Please wait..",
                                  ),
                                ],
                              )
                            : Text(
                                "Reset",
                              ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
