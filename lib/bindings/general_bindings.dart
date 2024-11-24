import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/alarm_helper.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import 'package:medics/data/repositories/biodata/biodata_repository.dart';
import 'package:medics/data/repositories/events/event_repository.dart';
import 'package:medics/data/repositories/news/news_repository.dart';
import 'package:medics/data/repositories/onboarding/onboarding.dart';
import 'package:medics/data/repositories/questioner/questioner_repository.dart';
import '../core/utils/helpers/network_manager.dart';
import '../data/repositories/flyer/flyer_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AlarmHelper());
    Get.put(NetworkManager());
    Get.put(AuthenticationRepository());
    Get.put(OnboardingRepository());
    Get.put(FlyerRepository());
    Get.put(NewsRepository());
    Get.put(NewsRepository());
    Get.put(EventRepository());
    Get.put(BiodataRepository());
    Get.put(QuestionRepository());
  }
}
