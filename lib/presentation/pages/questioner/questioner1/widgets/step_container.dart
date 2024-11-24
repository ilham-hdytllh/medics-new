import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/data/models/question.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../getx/questioner/questioner_first_controller.dart';

class StepContainer extends StatelessWidget {
  StepContainer({super.key, required this.data});

  final List<QuestionModel> data;

  final controller = Get.find<QuestionerFirstController>();
  @override
  Widget build(BuildContext context) {
    print(data);
    return SizedBox(
      height: 50,
      child: Obx(
        () => Row(
          children: List.generate(
            data.length,
            (index) => Flexible(
              child: Container(
                margin:
                    EdgeInsets.only(right: index == (data.length - 1) ? 0 : 3),
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: controller.index.value == index
                      ? CustomColors.primary
                      : CustomColors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
