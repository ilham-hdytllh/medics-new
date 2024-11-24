import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/exceptions/format_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';
import '../../models/onboarding.dart';

class OnboardingRepository extends GetxController {
  static OnboardingRepository get instance => Get.find();

  // Get Onboarding
  Future<List<OnBoardingModel>> getOnboarding() async {
    try {
      // Make GET request to API
      final response = await http.get(
        Uri.parse(ContantAPI.getOnboarding),
        headers: {
          'Accept': 'application/json',
        },
      );

      switch (response.statusCode) {
        case 200:
          final body = json.decode(response.body);
          return (body['data'] as List)
              .map((e) => OnBoardingModel.fromJson(e))
              .toList();
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
}
