import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/presentation/getx/profile/profile_controller.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/validators/validation.dart';

class FormUpdateProfile extends StatelessWidget {
  const FormUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Form(
      key: profileController.profileKey,
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
              controller: profileController.name.value,
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
              controller: profileController.email.value,
              readOnly: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Telphone
            TextFormField(
              keyboardType: TextInputType.text,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              controller: profileController.telp.value,
              decoration: InputDecoration(
                  prefixIcon: Icon(IconlyLight.call), labelText: "Telphone"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwInputFields,
            ),
            // Address
            TextFormField(
              keyboardType: TextInputType.text,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              controller: profileController.address.value,
              decoration: InputDecoration(
                  prefixIcon: Icon(IconlyLight.location), labelText: "Alamat"),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),

            // Sign In Button
            Obx(() => SizedBox(
                  height: CustomSizes.inputFieldHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      profileController.isLoading.value == false
                          ? await profileController.updateProfile()
                          : null;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      disabledBackgroundColor: CustomColors.grey,
                      disabledForegroundColor: CustomColors.primary,
                      foregroundColor: CustomColors.white,
                      backgroundColor: CustomColors.primary,
                    ),
                    child: profileController.isLoading.value
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
                            "Simpan",
                          ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
