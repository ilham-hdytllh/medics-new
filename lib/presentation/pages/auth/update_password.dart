import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/pages/auth/widgets/form_update_password.dart';
import '../../../core/constants/sizes.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

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
                "Ubah Password",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),
              Text(
                "Silahkan masukkan password lama dan baru anda",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              // Form
              const FormUpdatePassword(),

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
