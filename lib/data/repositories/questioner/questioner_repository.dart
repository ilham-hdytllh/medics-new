import 'dart:convert';

import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medics/data/models/question.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../routes/navigation_route.dart';

class QuestionRepository extends GetxController {
  static QuestionRepository get instance => Get.find();
  Future<Map<String, dynamic>> checkQuestioner(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.cekQuestionerStatus),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return body['data'];
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
          return {};
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  Future<List<QuestionModel>> fecthQuestionerFirst(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getQuestionerFirst),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          print(body);
          return (body['data'] as List)
              .map((e) => QuestionModel.fromJson(e))
              .toList();
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
          return [];
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  Future<List<QuestionModel>> fecthQuestioner30Day(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getQuestioner30Day),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return (body['data'] as List)
              .map((e) => QuestionModel.fromJson(e))
              .toList();
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
          return [];
      }
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  Future<void> storeQuestioner(
      String? token, List<Map<String, dynamic>> data) async {
    try {
      // Make GET request to API
      final response = await http.post(
        Uri.parse(ContantAPI.storeQuestioner),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(
          {"answers": data},
        ),
      );

      final body = json.decode(response.body);
      switch (response.statusCode) {
        case 201:
          print(body['message']);
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
          throw "${body['message']}";
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
