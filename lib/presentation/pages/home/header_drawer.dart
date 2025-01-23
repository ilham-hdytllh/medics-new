import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/constants/sizes.dart';
import 'package:medics/core/utils/extension/capitalize.dart';
import 'package:medics/presentation/getx/profile/profile_controller.dart';

class MyHeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Container(
      color: CustomColors.primary,
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => controller.pickImage(),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
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
                              : NetworkImage(
                                  controller.imageProfileActive.value),
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
          SizedBox(
            height: 10,
          ),
          Text(
            controller.userProfile.value.name.capitalizeAll(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: CustomColors.white,
                ),
          )
        ],
      ),
    );
  }
}
