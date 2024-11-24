import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../getx/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();
    return Positioned(
      top: CustomDeviceUtils.getAppBarHeight(),
      right: CustomSizes.defaultSpace,
      child: Obx(() => controller.currentPageIndex.value <
              (controller.onboardings.length - 1)
          ? GestureDetector(
              onTap: () => OnBoardingController.instance.skipPage(),
              child: const Text("Skip"),
            )
          : SizedBox()),
    );
  }
}
