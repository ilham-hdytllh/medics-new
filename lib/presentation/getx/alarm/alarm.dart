import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/helpers/alarm_helper.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/core/utils/sncakbar/snackbar.dart';

import '../../../data/repositories/medicine/medicine_repository.dart';

class AlarmController extends GetxController {
  RxInt faseValue = 1.obs;
  RxBool isLoading = false.obs;

  final alrm = Get.find<AlarmHelper>();

  @override
  void onInit() async {
    super.onInit();

    int? fase = await SharedPreferencesHelper.getFase();

    faseValue.value = fase ?? 1;
  }

  void changeFase(int fase) async {
    faseValue.value = fase;
    await SharedPreferencesHelper.saveFase(fase);

    await alrm.scheduleAlarm();

    Get.back();
  }

  Future<void> fecthRepo() async {
    String? token = await SharedPreferencesHelper.getToken();

    await alrm.alarmStop();

    if (token != null) {
      String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String time = DateFormat('HH:mm').format(DateTime.now());

      MediciniRepository controller = MediciniRepository();
      await controller.medicinePost(token, date, time);

      await alrm.scheduleAlarm();
    }
  }

  Future<void> snooze30() async {
    await alrm.snooze30();
  }

  Future<void> doneDrink() async {
    try {
      await fecthRepo();
      Get.back();
    } catch (e) {
      CustomSnackbar.errorSnackbar(
          title: "Error", message: "Terjadi kesalahan silahkan coba lagi.");
    }
  }
}
