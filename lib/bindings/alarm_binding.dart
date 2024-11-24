import 'package:get/get.dart';
import 'package:medics/presentation/getx/alarm/alarm.dart';

class AlarmBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AlarmController());
  }
}
