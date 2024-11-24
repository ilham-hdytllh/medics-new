import 'package:get/get.dart';
import 'package:medics/data/models/event.dart';
import 'package:medics/data/repositories/events/event_repository.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';

class EventListController extends GetxController {
  static EventListController get instance => Get.find();

  // Variable
  RxBool isLoading = false.obs;
  List<EventModel> events = <EventModel>[].obs;
  Rx<EventModel?> eventDetail = Rx<EventModel?>(null);

  @override
  void onInit() {
    fetchEvent();
    super.onInit();
  }

  Future<void> fetchEvent() async {
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

      List<EventModel> listEvent =
          await EventRepository.instance.getEvents(token!);

      events.addAll(listEvent);
    } catch (e) {
      print(e);
    } finally {
      // remove loader
      isLoading.value = false;
    }
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
