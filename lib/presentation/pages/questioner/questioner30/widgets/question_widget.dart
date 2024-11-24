import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../data/models/answer.dart';
import '../../../../getx/questioner/questioner_30_controller.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget(
      {super.key,
      required this.number,
      required this.question,
      required this.questionID,
      required this.data});
  final int number;
  final String question;
  final int questionID;
  final List<Answer> data;

  final controller = Get.find<Questioner30Controller>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${number}. ${question}"),
          SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          GetBuilder<Questioner30Controller>(builder: (context) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                leading: Checkbox(
                  value: controller.checkBoxTrueOrNot(data[index].id),
                  onChanged: (value) {
                    if (controller.isLoading.value) {
                      null;
                    } else {
                      controller.addAnswerToMap(questionID, data[index].id);
                    }
                  },
                ),
                title: Text(
                  data[index].title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
