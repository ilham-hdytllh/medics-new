import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';
import '../../../getx/auth/login_controller.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: CustomColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => LoginController.instance.signinWithGoogle(),
              icon: const Image(
                height: CustomSizes.iconMd,
                width: CustomSizes.iconMd,
                image: AssetImage(CustomImages.google),
              )),
        ),
      ],
    );
  }
}
