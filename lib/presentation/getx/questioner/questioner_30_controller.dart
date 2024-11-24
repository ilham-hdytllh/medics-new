import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/core/utils/sncakbar/snackbar.dart';
import 'package:medics/data/models/question.dart';
import 'package:medics/data/repositories/questioner/questioner_repository.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';

class Questioner30Controller extends GetxController {
  RxList<QuestionModel> questionFirstData = <QuestionModel>[].obs;
  PageController pageController = PageController();
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  RxList<Map<String, int>> selectedAnswers = <Map<String, int>>[].obs;

  @override
  void onInit() async {
    await fetchQuestioner30();
    super.onInit();
  }

  bool checkBoxTrueOrNot(int answerId) {
    return selectedAnswers.any((element) => element['answer_id'] == answerId);
  }

  void addAnswerToMap(int questionId, int answerId) {
    bool checkQuestion =
        selectedAnswers.any((element) => element['question_id'] == questionId);
    if (checkQuestion) {
      selectedAnswers
          .removeWhere((element) => element['question_id'] == questionId);
      selectedAnswers.add(
        {"question_id": questionId, "answer_id": answerId},
      );
    } else {
      selectedAnswers.add(
        {"question_id": questionId, "answer_id": answerId},
      );
    }

    print(selectedAnswers);
    update();
  }

  nextPage() {
    if (index.value < questionFirstData.length - 1) {
      index.value++;
      pageController.jumpToPage(index.value);
    }
  }

  prevPage() {
    if (index.value > 0) {
      index.value--;
      pageController.jumpToPage(index.value);
    }
  }

  Future<void> fetchQuestioner30() async {
    try {
      String? _token = await SharedPreferencesHelper.getToken();

      List<QuestionModel> listData =
          await QuestionRepository.instance.fecthQuestioner30Day(_token);

      questionFirstData.addAll(listData);
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeQuestioner() async {
    try {

      if (selectedAnswers.length < 5) {
        CustomSnackbar.errorSnackbar(title: "Error", message: "Mohon lengkapi jawaban anda.");
        return;
      }

      isLoading(true);

      String? token = await SharedPreferencesHelper.getToken();

      await QuestionRepository.instance.storeQuestioner(token, selectedAnswers);

      await AuthenticationRepository.instance.screenRedirect();

      selectedAnswers.clear();
      index.value = 0;
      pageController.jumpToPage(0);
    } catch (e) {
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      isLoading(false);
    }
  }
}
