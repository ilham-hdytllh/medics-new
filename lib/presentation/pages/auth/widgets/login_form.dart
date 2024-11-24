import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/presentation/getx/auth/login_controller.dart';
import 'package:medics/routes/navigation_route.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      key: loginController.loginKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
        child: Column(
          children: [
            // Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              validator: (value) => CustomValidator.validateEmail(value),
              controller: loginController.email.value,
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
                  controller: loginController.password.value,
                  obscureText: loginController.obsecure.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () => loginController.obsecure.value =
                          !loginController.obsecure.value,
                      child: Icon(loginController.obsecure.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields / 2,
            ),

            // Remember Me & Forgot Pw
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Forget Pw
                TextButton(
                  onPressed: () => Get.toNamed(AppLinks.FORGOTPASSWORD),
                  child: Text(
                    "Lupa password ?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: CustomColors.primary),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),

            // Sign In Button
            Obx(() => SizedBox(
                  height: CustomSizes.inputFieldHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      loginController.isLoading.value == false
                          ? await loginController.signinWithEmailPassword()
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      disabledBackgroundColor: CustomColors.grey,
                      disabledForegroundColor: CustomColors.primary,
                      foregroundColor: CustomColors.white,
                      backgroundColor: CustomColors.primary,
                    ),
                    child: loginController.isLoading.value
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
                            "Masuk",
                          ),
                  ),
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),

            // Create Account Button
            SizedBox(
              height: CustomSizes.inputFieldHeight,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.toNamed(AppLinks.SIGNUP),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    foregroundColor: CustomColors.primary,
                    backgroundColor: Colors.transparent),
                child: Text(
                  "Buat Akun",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
