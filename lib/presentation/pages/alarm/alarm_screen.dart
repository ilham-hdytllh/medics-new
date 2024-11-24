import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/getx/alarm/alarm.dart';
import '../../../core/constants/colors.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final setfaseController = Get.put(AlarmController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Obx(
          () => ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.all(10),
                    radius: 10,
                    title: 'Peringatan',
                    middleText: 'Anda yakin ubah ke phase 1 ?',
                    onConfirm: () => setfaseController.changeFase(1),
                    onCancel: () => Get.back(),
                    buttonColor: CustomColors.primary,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: setfaseController.faseValue.value == 1 ? 3 : 1,
                        color: setfaseController.faseValue.value == 1
                            ? CustomColors.primary
                            : CustomColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alarm Phase 1",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Text(
                                      "Setiap Hari",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.white,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "07:00",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.all(10),
                    radius: 10,
                    title: 'Peringatan',
                    middleText: 'Anda yakin ubah ke phase 2 ?',
                    onConfirm: () => setfaseController.changeFase(2),
                    onCancel: () => Get.back(),
                    buttonColor: CustomColors.primary,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: setfaseController.faseValue.value == 2 ? 3 : 1,
                        color: setfaseController.faseValue.value == 2
                            ? CustomColors.primary
                            : CustomColors.darkGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alarm Phase 2",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 2),
                                    decoration: BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Text(
                                      "Selasa",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.white,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 2),
                                    decoration: BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Text(
                                      "Kamis",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.white,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 2),
                                    decoration: BoxDecoration(
                                      color: CustomColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Text(
                                      "Sabtu",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.white,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "07:00",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
