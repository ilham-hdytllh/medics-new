import 'dart:convert';
import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medics/data/models/event.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../routes/navigation_route.dart';

class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  // Get Events
  Future<List<EventModel>> getEvents(String? token) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getEvents),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return (body['data'] as List)
              .map((e) => EventModel.fromJson(e))
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

  // Event detail
  Future<EventModel> getEventDetail(String? token, int id) async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse("${ContantAPI.getEvents}/$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return EventModel.fromJson(body['data']);
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
          return EventModel.empty();
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
