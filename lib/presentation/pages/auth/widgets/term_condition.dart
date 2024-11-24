import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/auth/signup_controller.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterController>();
    return Row(
      children: [
        SizedBox(
          child: Obx(() => Checkbox(
              value: registerController.privacyandpolicy.value,
              onChanged: (value) =>
                  registerController.privacyandpolicy.value = value!)),
        ),
        Expanded(
          child: Text("Saya menyetujui semua kondisi dan persyaratan"),
        ),
      ],
    );
  }
}
