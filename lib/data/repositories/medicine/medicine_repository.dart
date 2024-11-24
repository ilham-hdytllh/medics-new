import 'dart:convert';
import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../routes/navigation_route.dart';

class MediciniRepository {
  // Biodata update
  Future<void> medicinePost(String? token, String date, String time) async {
    try {
      // Make GET request to API
      final response = await http.post(
        Uri.parse("${ContantAPI.sendMedicine}"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {
            "date": date,
            "time": time,
          },
        ),
      );

      switch (response.statusCode) {
        case 201:
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
