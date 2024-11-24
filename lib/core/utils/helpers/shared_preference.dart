import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Import for json.encode and json.decode

class SharedPreferencesHelper {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userData');
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'userData', json.encode(userData)); // Use json.encode here
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    return userData != null
        ? json.decode(userData)
        : null; // Use json.decode here
  }

  /// Hapus user data yang disimpan
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
  }

  /// Save the isFirstTime flag
  static Future<void> setFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', value);
  }

  /// Retrieve the isFirstTime flag
  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true; // Default to true if null
  }

  // /// Save the isAlarm flag
  // static Future<void> setAlarm(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isAlarm', value);
  // }

  // /// Retrieve the isAlarm flag
  // static Future<bool> isAlarm() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('isAlarm') ?? false; // Default to true if null
  // }

  // /// Save the isRescheduleflag
  // static Future<void> setReschedule(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isReschedule', value);
  // }

  // /// Retrieve the isReschedule flag
  // static Future<bool> isReschedule() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('isReschedule') ?? false; // Default to true if null
  // }

  /// Save the selected fase (1 or 2)
  static Future<void> saveFase(int fase) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedFase', fase);
  }

  // /// Get the selected type alarm
  // static Future<int?> getTypeAlarm() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt('typeAlarm');
  // }

  // /// Save the selected type alarm
  // static Future<void> saveTypeAlarm(int typeAlarm) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('typeAlarm', typeAlarm);
  // }

  /// Get the selected fase (returns 1 or 2)
  static Future<int?> getFase() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selectedFase');
  }

  /// Hapus fase yang disimpan
  static Future<void> clearFase() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedFase');
  }
}
