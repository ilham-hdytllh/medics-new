import 'package:get/get.dart';
import 'package:medics/presentation/getx/questioner/questioner_30_controller.dart';
import 'package:medics/presentation/getx/questioner/questioner_first_controller.dart';

class QuestionerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(QuestionerFirstController());
    Get.put(Questioner30Controller());
  }
}
