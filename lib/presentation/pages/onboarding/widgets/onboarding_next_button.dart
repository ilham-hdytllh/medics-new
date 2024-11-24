import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../getx/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();
    return Positioned(
        bottom: CustomDeviceUtils.getBottomNavigationBarHeight(),
        left: 15,
        right: 15,
        child: SizedBox(
          height: CustomSizes.inputFieldHeight,
          width: double.infinity,
          child: Obx(
            () => ElevatedButton(
              onPressed: () => OnBoardingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  foregroundColor: CustomColors.white,
                  backgroundColor: CustomColors.primary),
              child: Text(
                controller.currentPageIndex.value ==
                        (controller.onboardings.length - 1)
                    ? "Masuk"
                    : "Next",
              ),
            ),
          ),
        ));
  }
}
