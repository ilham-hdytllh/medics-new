import 'package:get/get.dart';
import 'package:medics/data/models/event.dart';
import 'package:medics/data/repositories/events/event_repository.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';

class EventDetailController extends GetxController {
  static EventDetailController get instance => Get.find();

  // Variable
  RxBool isLoading = false.obs;
  Rx<EventModel?> eventDetail = Rx<EventModel?>(null);

  @override
  void onInit() {
    final int eventID = Get.arguments;
    fetchEventDetail(eventID);
    super.onInit();
  }

  Future<void> fetchEventDetail(int eventID) async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      String? token = await SharedPreferencesHelper.getToken();
      EventModel detailEvent =
          await EventRepository.instance.getEventDetail(token!, eventID);
      eventDetail.value = detailEvent;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
