import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/core/utils/sncakbar/snackbar.dart';
import 'package:medics/data/models/user.dart';
import '../../../core/utils/helpers/network_manager.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  /// Variables
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  Rx<UserModel> userProfile = Rx<UserModel>(
      UserModel(name: '', email: '', address: '', phone: '', image: ''));
  final name = TextEditingController().obs;
  final email = TextEditingController().obs;
  final telp = TextEditingController().obs;
  final address = TextEditingController().obs;
  RxString imageProfileActive = ''.obs;
  int? logGoogle;
  RxString imagePath = ''.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    isLoading.value = true;

    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path;

        // Navigasi ke halaman pratinjau
        Get.toNamed('imagePreview');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadImage() async {
    String? token = await SharedPreferencesHelper.getToken();

    try {
      isLoading(true);
      if (imagePath.value.isNotEmpty) {
        await AuthenticationRepository.instance
            .changeImageProfile(token, imagePath.value);

        Get.back();
        fetchProfile();
      } else {
        CustomSnackbar.warningSnackbar(
            title: "Oopps", message: "Anda belum memilih gambar");
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar(
          title: "Error", message: "Terjadi kesalahan, coba lagi nanti");
    } finally {
      isLoading(false);
    }
  }

  void fetchProfile() async {
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

      Map<String, dynamic>? loggedGoogle =
          await SharedPreferencesHelper.getUserData();

      logGoogle = loggedGoogle!['is_google_login'];

      // Register user in the firebase auth & save data in firebase
      userProfile.value =
          await AuthenticationRepository.instance.getProfile(token);

      name.value.text = userProfile.value.name;
      email.value.text = userProfile.value.email;
      telp.value.text = userProfile.value.phone;
      address.value.text = userProfile.value.address;
      imageProfileActive.value = userProfile.value.image;
    } catch (e) {
      print(e);
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
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

      // Register user in the firebase auth & save data in firebase
      await AuthenticationRepository.instance.updateProfile(
          token!,
          name.value.text.trim(),
          address.value.text.trim(),
          telp.value.text.trim());

      name.value.clear();
      email.value.clear();
      telp.value.clear();
      address.value.clear();

      fetchProfile();

      CustomSnackbar.successSnackbar(
          title: "Success", message: "Profile berhasil diubah");
    } catch (e) {
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
