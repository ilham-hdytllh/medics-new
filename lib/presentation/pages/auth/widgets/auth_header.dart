import 'package:flutter/material.dart';
import 'package:medics/core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 170,
            child: Image.asset(
              CustomImages.logo,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwText,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwInputFields,
        ),
      ],
    );
  }
}
