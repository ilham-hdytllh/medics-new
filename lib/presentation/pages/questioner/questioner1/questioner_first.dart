import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/sizes.dart';
import '../../../getx/questioner/questioner_first_controller.dart';
import 'widgets/step_container.dart';
import 'widgets/button_prev_next.dart';
import 'widgets/question_widget.dart';

class QuestionerFirst extends StatelessWidget {
  final controller = Get.put(QuestionerFirstController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Questioner Awal'),
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
                  height: 320,
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
