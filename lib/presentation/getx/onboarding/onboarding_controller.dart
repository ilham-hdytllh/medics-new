import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/network_manager.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/models/onboarding.dart';
import 'package:medics/routes/navigation_route.dart';

import '../../../data/repositories/onboarding/onboarding.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  List<OnBoardingModel> onboardings = <OnBoardingModel>[].obs;

  @override
  void onInit() {
    fetchOnboarding();
    super.onInit();
  }

  Future<void> fetchOnboarding() async {
    try {
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      List<OnBoardingModel> listOnboard =
          await OnboardingRepository.instance.getOnboarding();

      onboardings.addAll(listOnboard);
    } catch (e) {
      print(e);
    }
  }

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Update if scroll
  void pageChanged(index) => currentPageIndex.value = index;

  /// Jump to the spesific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == (onboardings.length - 1)) {
      SharedPreferencesHelper.setFirstTime(false);

      Get.offAllNamed(AppLinks.LOGIN);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value =
        (onboardings.length - 1); // Mengubah nilai currentPageIndex menjadi 2
    pageController.animateToPage(
      (onboardings.length - 1), // Langsung melompat ke halaman 2
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
