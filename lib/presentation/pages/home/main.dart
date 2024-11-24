import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/presentation/getx/home/home_controller.dart';
import '../profile/profile.dart';
import 'home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pagesController = Get.put(HomeController());
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pagesController.pageController,
        children: [
          HomeScreen(),
          // QuestionerFirst(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          enableFeedback: false,
          selectedItemColor: CustomColors.primary,
          unselectedItemColor: CustomColors.primary,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(pagesController.currentPage.value == 0
                  ? IconlyBold.home
                  : IconlyLight.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(pagesController.currentPage.value == 1
                  ? IconlyBold.profile
                  : IconlyLight.profile),
              label: 'Profile',
            ),
          ],
          currentIndex: pagesController.currentPage.value,
          onTap: (index) {
            pagesController.changePage(index);
          },
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
