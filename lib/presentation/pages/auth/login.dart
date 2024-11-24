import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import 'widgets/form_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/auth_header.dart';
import 'widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpacePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo app, title, sub title
              AuthHeader(
                title: "Login",
                subTitle: "Silahkan masukkan kredensial anda",
              ),

              // Form
              const LoginForm(),

              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),

              // Divider
              FormDivider(dividerText: CustomTexts.orSignin.capitalize!),

              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),

              // Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
