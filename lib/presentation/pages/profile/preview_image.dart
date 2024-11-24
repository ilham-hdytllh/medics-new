import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/presentation/getx/profile/profile_controller.dart';

import '../../../core/constants/sizes.dart';

class ImagePreview extends StatelessWidget {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: CustomColors.black,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: CustomColors.white,
            ),
          ),
          title: Text(
            'Preview',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: CustomColors.white, fontWeight: FontWeight.w400),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.black,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CircleAvatar(
                        radius: 120,
                        backgroundColor: CustomColors.black,
                        backgroundImage: controller.imagePath.value.isNotEmpty
                            ? FileImage(
                                File(controller.imagePath.value),
                              )
                            : AssetImage(CustomImages.emptyProfile),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 40, left: 15, right: 15),
                      child: Obx(
                        () => SizedBox(
                          height: CustomSizes.inputFieldHeight,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.uploadImage();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              disabledBackgroundColor: CustomColors.grey,
                              disabledForegroundColor: CustomColors.primary,
                              foregroundColor: CustomColors.white,
                              backgroundColor: CustomColors.primary,
                            ),
                            child: controller.isLoading.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: CircularProgressIndicator(
                                          color: CustomColors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Please wait..",
                                      ),
                                    ],
                                  )
                                : Text(
                                    "Simpan",
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
