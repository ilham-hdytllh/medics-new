import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medics/data/models/biodata.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../routes/navigation_route.dart';

class BiodataRepository extends GetxController {
  static BiodataRepository get instance => Get.find();

  // Biodata get
  Future<BiodataModel?> getBiodata(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse("${ContantAPI.biodata}"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return BiodataModel.fromJson(body['data']);
        case 401:
        case 403:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();

          Alarm.stopAll();
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        default:
          return null;
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  // Biodata update
  Future<void> updateBiodata(String? token, BiodataModel biodataModel) async {
    try {
      print(json.encode({
        "nama": biodataModel.nama,
        "tempat_lahir": biodataModel.tempatLahir,
        "tanggal_lahir": biodataModel.tanggalLahir,
        "alamat": biodataModel.alamat,
        "usia": biodataModel.usia,
        "jenis_kelamin": biodataModel.jenisKelamin,
        "pendidikan": biodataModel.pendidikan,
        "pekerjaan": biodataModel.pekerjaan,
        "status_tinggal": biodataModel.statusTinggal,
        "lokasi": biodataModel.lokasi,
        "fase": biodataModel.fase
      }));
      // Make GET request to API
      final response = await http.put(
        Uri.parse("${ContantAPI.biodata}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "nama": biodataModel.nama,
          "tempat_lahir": biodataModel.tempatLahir,
          "tanggal_lahir": biodataModel.tanggalLahir,
          "alamat": biodataModel.alamat,
          "usia": biodataModel.usia,
          "jenis_kelamin": biodataModel.jenisKelamin,
          "pendidikan": biodataModel.pendidikan,
          "pekerjaan": biodataModel.pekerjaan,
          "status_tinggal": biodataModel.statusTinggal,
          "lokasi": biodataModel.lokasi,
          "fase": biodataModel.fase
        }),
      );

      print(response.body);
      switch (response.statusCode) {
        case 200:
          print('success');
        case 401:
        case 403:
          await SharedPreferencesHelper.clearToken();
          await SharedPreferencesHelper.clearUserData();
          await SharedPreferencesHelper.clearFase();

          Alarm.stopAll();
          Get.offAllNamed(AppLinks.LOGIN);
          Get.deleteAll();
          throw 'Session expired';
        default:
          throw 'Terjadi kesalahan coba lagi nanti';
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }
}
