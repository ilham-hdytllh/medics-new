import 'package:alarm/alarm.dart';
import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmPermissions {
  static Future<void> checkNotificationPermission() async {
    final _notification = FlutterLocalNotificationsPlugin();
    final status = await Permission.notification.status;
    if (status.isDenied) {
      alarmPrint('Requesting notification permission...');
      _notification
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
      alarmPrint(
        'Notification permission granted',
      );
    }
  }

  static Future<void> checkAndroidExternalStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      alarmPrint('Requesting external storage permission...');
      final res = await Permission.storage.request();
      alarmPrint(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    alarmPrint('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      alarmPrint('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      alarmPrint(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkBatteryOptimize() async {
    bool? isAllBatteryOptimizationDisabled =
        await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;

    print(isAllBatteryOptimizationDisabled);

    if (isAllBatteryOptimizationDisabled == null ||
        !isAllBatteryOptimizationDisabled) {
      DisableBatteryOptimization.showDisableAllOptimizationsSettings(
          "Enable Auto Start",
          "Follow the steps and enable the auto start of this app",
          "Your device has additional battery optimization",
          "Follow the steps and disable the optimizations to allow smooth functioning of this app");
    }
  }
}
