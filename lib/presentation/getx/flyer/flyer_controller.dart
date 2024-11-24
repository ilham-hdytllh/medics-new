import 'package:get/get.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../data/models/flyer.dart';
import '../../../data/repositories/flyer/flyer_repository.dart';

class FlyerController extends GetxController {
  static FlyerController get instance => Get.find();

  // Variable
  RxBool isLoading = false.obs;
  List<FlyerModel> flyers = <FlyerModel>[].obs;

  @override
  void onInit() {
    fetchFlyer();
    super.onInit();
  }

  Future<void> fetchFlyer() async {
    try {
      // start loading
      isLoading.value = true;

      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      String? token = await SharedPreferencesHelper.getToken();

      List<FlyerModel> listFlyer =
          await FlyerRepository.instance.getFlyer(token!);

      flyers.addAll(listFlyer);
    } catch (e) {
      print(e);
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
