import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/utils/validators/validation.dart';
import 'package:medics/presentation/pages/auth/widgets/term_condition.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../getx/auth/signup_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    return Form(
      key: registerController.registerKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Nama
            TextFormField(
              keyboardType: TextInputType.text,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              validator: (value) =>
                  CustomValidator.validateEmptyText("Nama", value),
              controller: registerController.name.value,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: "Nama"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              validator: (value) => CustomValidator.validateEmail(value),
              controller: registerController.email.value,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Password
            Obx(() => TextFormField(
                  keyboardType: TextInputType.text,
                  onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  validator: (value) => CustomValidator.validatePassword(value),
                  controller: registerController.password.value,
                  obscureText: registerController.obsecure.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () => registerController.obsecure.value =
                          !registerController.obsecure.value,
                      child: Icon(registerController.obsecure.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),

            // Term and Condition
            TermsAndConditionCheckbox(),

            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),

            // Sign In Button
            Obx(() => SizedBox(
                  height: CustomSizes.inputFieldHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: registerController.privacyandpolicy.value
                        ? () async {
                            registerController.isLoading.value == false
                                ? await registerController
                                    .singupWithEmailPassword()
                                : null;
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      disabledBackgroundColor: CustomColors.grey,
                      disabledForegroundColor: CustomColors.primary,
                      foregroundColor: CustomColors.white,
                      backgroundColor: CustomColors.primary,
                    ),
                    child: registerController.isLoading.value
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
                            "Daftar",
                          ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
