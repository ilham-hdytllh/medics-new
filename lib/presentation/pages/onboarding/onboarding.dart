import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/getx/onboarding/onboarding_controller.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_pages.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Horizontal scrollable pages
          Obx(
            () => PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardings.length,
              onPageChanged: (index) {
                controller.pageChanged(index);
              },
              itemBuilder: (context, index) {
                return OnBoardingPage(
                    image: controller.onboardings[index].image,
                    title: controller.onboardings[index].title);
              },
            ),
          ),
          // Skip button
          const OnBoardingSkip(),
          // Dot navigation page indicator
          const OnBoardingDotNavigation(),
          // Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
