import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/presentation/pages/auth/widgets/register_form.dart';
import '../../../core/constants/sizes.dart';
import '../../../routes/navigation_route.dart';
import 'widgets/auth_header.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpacePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo app, title, sub title
              AuthHeader(
                title: 'Daftar',
                subTitle: 'Pastikan semua data yang di daftarkan sesuai',
              ),

              // Form
              const RegisterForm(),

              const SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),

              // Remember Me & Forgot Pw
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun ?"),
                  TextButton(
                    onPressed: () => Get.toNamed(AppLinks.LOGIN),
                    child: Text(
                      "Masuk",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: CustomColors.primary),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
