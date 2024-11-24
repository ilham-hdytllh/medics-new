import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/sizes.dart';
import 'package:medics/presentation/getx/questioner/questioner_30_controller.dart';
import 'package:medics/presentation/pages/questioner/questioner30/widgets/button_prev_next.dart';
import 'package:medics/presentation/pages/questioner/questioner30/widgets/question_widget.dart';
import 'package:medics/presentation/pages/questioner/questioner30/widgets/step_container.dart';

class Questioner30 extends StatelessWidget {
  final controller = Get.put(Questioner30Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Questioner 30 Hari'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              StepContainer(
                data: controller.questionFirstData,
              ),
              SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),
              Obx(
                () => SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.questionFirstData.length,
                    controller: controller.pageController,
                    itemBuilder: (context, index) {
                      return QuestionWidget(
                        number: index + 1,
                        questionID: controller.questionFirstData[index].id,
                        question: controller.questionFirstData[index].title,
                        data: controller.questionFirstData[index].answers,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),
              ButtonPrevAndNext(),
            ],
          ),
        ),
      ),
    );
  }
}
