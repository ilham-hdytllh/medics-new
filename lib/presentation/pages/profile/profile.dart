import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/utils/extension/capitalize.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/models/user.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import 'package:medics/presentation/getx/profile/profile_controller.dart';
import 'package:medics/routes/navigation_route.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/sizes.dart';
import '../../getx/home/home_controller.dart';
import 'widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      backgroundColor: CustomColors.primary.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Obx(() {
          if (profileController.isLoading.value) {
            return _buildShimmerEffect(profileController);
          } else {
            return _buildUserProfile(context,
                profileController.userProfile.value, profileController);
          }
        }),
      ),
    );
  }
}

Widget _buildUserProfile(
    BuildContext context, UserModel user, ProfileController controller) {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      GestureDetector(
        onTap: () => controller.pickImage(),
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: controller.imageProfileActive.value.isEmpty
                          ? AssetImage(CustomImages.emptyProfile)
                          : NetworkImage(controller.imageProfileActive.value),
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Iconsax.camera,
                    size: CustomSizes.md,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user.name.capitalizeAll(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: CustomColors.white,
                ),
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        height: 550,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.UPDATEPROFILE, arguments: user),
            child: ProfileList(
              icon: IconlyBold.profile,
              title: "Profile",
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.COMPLETEBIODATA),
            child: ProfileList(
              icon: IconlyBold.profile,
              title: "Biodata",
              color: Colors.black87,
            ),
          ),
          controller.logGoogle == 0
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                )
              : SizedBox(),
          controller.logGoogle == 0
              ? GestureDetector(
                  onTap: () => Get.toNamed(AppLinks.UPDATEPASSWORD),
                  child: ProfileList(
                    icon: IconlyBold.lock,
                    title: "Password",
                    color: Colors.black87,
                  ),
                )
              : SizedBox(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.ALARM),
            child: ProfileList(
              icon: IconlyBold.timeCircle,
              title: "Alarm",
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () async {
              String? token = await SharedPreferencesHelper.getToken();

              await AuthenticationRepository.instance.logout(token);
            },
            child: ProfileList(
              icon: IconlyBold.logout,
              title: "Keluar",
              color: Colors.black87,
            ),
          ),
        ]),
      ),
    ],
  );
}

Widget _buildShimmerEffect(ProfileController controller) {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Center(
        child: Stack(
          children: [
            SizedBox(
              height: 50,
            ),
            Shimmer.fromColors(
                baseColor: CustomColors.lightGrey,
                highlightColor: CustomColors.darkGrey,
                child: CircleAvatar(
                  radius: 60,
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: Shimmer.fromColors(
                baseColor: CustomColors.lightGrey,
                highlightColor: CustomColors.darkGrey,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Iconsax.camera,
                    size: CustomSizes.md,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Shimmer.fromColors(
        baseColor: CustomColors.lightGrey,
        highlightColor: CustomColors.darkGrey,
        child: Container(
          width: 160,
          height: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        height: 550,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.UPDATEPROFILE),
            child: ProfileList(
              icon: IconlyBold.profile,
              title: "Profile",
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.UPDATEPROFILE),
            child: ProfileList(
              icon: IconlyBold.profile,
              title: "Biodata",
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          controller.logGoogle == 0
              ? GestureDetector(
                  onTap: () => Get.toNamed(AppLinks.UPDATEPASSWORD),
                  child: ProfileList(
                    icon: IconlyBold.lock,
                    title: "Password",
                    color: Colors.black87,
                  ),
                )
              : SizedBox(),
          controller.logGoogle == 0
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Divider(),
                )
              : SizedBox(),
          GestureDetector(
            onTap: () => Get.toNamed(AppLinks.ALARM),
            child: ProfileList(
              icon: IconlyBold.timeCircle,
              title: "Alarm",
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () async {
              String? token = await SharedPreferencesHelper.getToken();

              await AuthenticationRepository.instance.logout(token);

              HomeController.instance.currentPage.value = 0;
            },
            child: ProfileList(
              icon: IconlyBold.logout,
              title: "Keluar",
              color: Colors.black87,
            ),
          ),
        ]),
      ),
    ],
  );
}
