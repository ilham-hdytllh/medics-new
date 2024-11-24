import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/utils/validators/validation.dart';
import 'package:medics/presentation/getx/auth/change_password_controller.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class FormUpdatePassword extends StatelessWidget {
  const FormUpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordController = Get.put(ChangePasswordController());
    return Form(
      key: changePasswordController.changePasswordKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Password Old
            Obx(() => TextFormField(
                  keyboardType: TextInputType.text,
                  onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  validator: (value) => CustomValidator.validatePassword(value),
                  controller: changePasswordController.currentPassword.value,
                  obscureText: changePasswordController.obsecure1.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: "Password Lama",
                    suffixIcon: GestureDetector(
                      onTap: () => changePasswordController.obsecure1.value =
                          !changePasswordController.obsecure1.value,
                      child: Icon(changePasswordController.obsecure1.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            // Password New
            Obx(() => TextFormField(
                  keyboardType: TextInputType.text,
                  onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  validator: (value) => CustomValidator.validatePassword(value),
                  controller: changePasswordController.newPassword.value,
                  obscureText: changePasswordController.obsecure2.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: "Password Baru",
                    suffixIcon: GestureDetector(
                      onTap: () => changePasswordController.obsecure2.value =
                          !changePasswordController.obsecure2.value,
                      child: Icon(changePasswordController.obsecure2.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),

            // Sign In Button
            Obx(() => SizedBox(
                  height: CustomSizes.inputFieldHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      changePasswordController.isLoading.value == false
                          ? await changePasswordController.changePassword()
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      disabledBackgroundColor: CustomColors.grey,
                      disabledForegroundColor: CustomColors.primary,
                      foregroundColor: CustomColors.white,
                      backgroundColor: CustomColors.primary,
                    ),
                    child: changePasswordController.isLoading.value
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
                            "Ubah",
                          ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
