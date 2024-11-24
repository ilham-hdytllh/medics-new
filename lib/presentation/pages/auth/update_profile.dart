import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../../core/constants/sizes.dart';
import 'widgets/form_update_profile.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(), child: Icon(IconlyLight.arrowLeft)),
      ),
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpacePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),
              // Logo app, title, sub title
              Text(
                "Update Profile",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),
              Text(
                "Harap masukkan data sesuai dengan data diri anda sebenarnya",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              // Form
              FormUpdateProfile(),

              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
