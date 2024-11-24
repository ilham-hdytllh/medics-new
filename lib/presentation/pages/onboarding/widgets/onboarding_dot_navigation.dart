import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../getx/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Positioned(
      left: 10,
      right: 10,
      bottom: CustomDeviceUtils.getBottomNavigationBarHeight() + 75,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor:
                  dark ? CustomColors.secondary : CustomColors.primary,
              dotHeight: 6),
        ),
      ),
    );
  }
}
