import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/presentation/getx/profile/complete_biodata.dart';
import '../../../core/constants/sizes.dart';

// ignore: must_be_immutable
class CompleteBiodataUpdate extends StatelessWidget {
  CompleteBiodataUpdate({super.key});

  GlobalKey<FormState> biodataKey = GlobalKey<FormState>();
  final controller = Get.find<CompleteBiodataUpdateController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ubah Biodata"),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: biodataKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Nama (Inisial)'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.nameController.value,
                      onTapOutside: (value) => FocusScope.of(context).unfocus(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Tempat,Tanggal Lahir'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.placeController.value,
                            keyboardType: TextInputType.text,
                            onTapOutside: (value) =>
                                FocusScope.of(context).unfocus(),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(
                          () => Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.none,
                              controller: controller.dateController.value,
                              onTap: () => controller.chooseDate(),
                              onTapOutside: (value) =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Alamat Tempat Tinggal'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.addressController.value,
                      onTapOutside: (value) => FocusScope.of(context).unfocus(),
                      maxLines: 3,
                      minLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Usia'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.ageController.value,
                      onTapOutside: (value) => FocusScope.of(context).unfocus(),
                      maxLines: 3,
                      minLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Jenis Kelamin'),
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        dropdownColor: CustomColors.white,
                        items: controller.gender
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedGender.value = newValue;
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: controller.selectedGender.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Tingkat Pendidikan Terakhir'),
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        dropdownColor: CustomColors.white,
                        items: controller.education
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedEducation.value = newValue;
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: controller.selectedEducation.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Pekerjaan'),
                    ),
                    Obx(
                      () => controller.isCustomJob.value
                          ? TextFormField(
                              controller: controller.jobController.value,
                              onChanged: (newValue) {
                                controller.selectedJob.value = newValue;
                              },
                            )
                          : DropdownButtonFormField(
                              dropdownColor: Colors.white,
                              items: controller.job
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()
                                ..add(
                                  DropdownMenuItem(
                                    value: 'Lainnya',
                                    child: Text('Lainnya (Masukkan sendiri)'),
                                  ),
                                ), // Tambah opsi 'Lainnya' untuk input custom
                              onChanged: (newValue) {
                                if (newValue == 'Lainnya') {
                                  controller.isCustomJob.value = true;
                                } else {
                                  controller.selectedJob.value =
                                      newValue.toString();
                                }
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              value: controller.selectedJob.value.isEmpty
                                  ? null
                                  : controller.selectedJob.value,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Status Tinggal'),
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        dropdownColor: CustomColors.white,
                        items: controller.live
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedLive.value = newValue;
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: controller.selectedLive.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Lokasi'),
                    ),
                    Obx(
                          () => DropdownButtonFormField(
                        dropdownColor: CustomColors.white,
                        items: controller.location
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedLocation.value = newValue;
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: controller.selectedLocation.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2, top: 15),
                      child: Text('Pilih Fase'),
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        dropdownColor: CustomColors.white,
                        items: controller.fase
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedPhase.value = newValue;
                          }
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        value: controller.selectedPhase.value,
                      ),
                    ),
                    const SizedBox(
                      height: CustomSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: CustomColors.white,
          child: Obx(
            () => SizedBox(
              height: CustomSizes.inputFieldHeight,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // form validation
                  if (biodataKey.currentState!.validate()) {
                    controller.isLoading.value
                        ? null
                        : await controller.chooseFase();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  disabledBackgroundColor: CustomColors.grey,
                  disabledForegroundColor: CustomColors.primary,
                  foregroundColor: CustomColors.white,
                  backgroundColor: CustomColors.primary,
                ),
                child: controller.isLoading.value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              color: CustomColors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Please wait..",
                          ),
                        ],
                      )
                    : Text(
                        "Simpan",
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
