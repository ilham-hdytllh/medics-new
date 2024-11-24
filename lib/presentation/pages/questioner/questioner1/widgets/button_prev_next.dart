import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../getx/questioner/questioner_first_controller.dart';

class ButtonPrevAndNext extends StatelessWidget {
  final controller = Get.find<QuestionerFirstController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.index == 0
              ? SizedBox()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.buttonSecondary,
                      foregroundColor: CustomColors.white),
                  onPressed: () {
                    if (controller.isLoading.value) {
                      null;
                    } else {
                      controller.prevPage();
                    }
                  },
                  child: Text("Sebelumnya"),
                ),
          ElevatedButton(
            onPressed:
                controller.index.value < controller.questionFirstData.length - 1
                    ? () {
                        if (controller.isLoading.value) {
                          null;
                        } else {
                          controller.nextPage();
                        }
                      }
                    : () async {
                        if (controller.isLoading.value) {
                          null;
                        } else {
                          await controller.storeQuestioner();
                        }
                      },
            child: controller.isLoading.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                : Text(controller.index.value <
                        controller.questionFirstData.length - 1
                    ? "Selanjutnya"
                    : "Submit"),
          ),
        ],
      ),
    );
  }
}
