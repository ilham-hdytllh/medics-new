import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.image, required this.title});

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            height: CustomHelperFunctions.screenHeight() * 0.4,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwSections,
          ),
          Text(
            title,
            style: CustomHelperFunctions.screenWidth() >= 800
                ? Theme.of(context).textTheme.headlineLarge
                : Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          // const SizedBox(
          //   height: CustomSizes.spaceBtwItems,
          // ),
          // Text(
          //   subTitle,
          //   style: CustomHelperFunctions.screenWidth() >= 800
          //       ? Theme.of(context)
          //           .textTheme
          //           .titleMedium!
          //           .copyWith(fontWeight: FontWeight.w400)
          //       : Theme.of(context).textTheme.labelMedium,
          //   textAlign: TextAlign.left,
          // ),
        ],
      ),
    );
  }
}
