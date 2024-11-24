import 'package:get/get.dart';

import '../presentation/getx/profile/complete_biodata.dart';

class CompleteBiodataBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CompleteBiodataUpdateController());
  }
}
