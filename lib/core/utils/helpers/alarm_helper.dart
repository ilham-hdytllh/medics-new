import 'dart:async';
import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/helpers/permission_handler.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';
import 'package:medics/routes/navigation_route.dart';
import 'package:flutter/services.dart';

class AlarmHelper extends GetxController {
  static const MethodChannel _channel = MethodChannel('alarm_channel');
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamSubscription<AlarmSettings>? ringSubscription;

  @override
  void onInit() async {
    super.onInit();
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    AlarmPermissions.checkNotificationPermission();
    AlarmPermissions.checkBatteryOptimize();

    if (Alarm.android) {
      AlarmPermissions.checkAndroidScheduleExactAlarmPermission();
    }

    ringSubscription ??= Alarm.ringStream.stream.listen(navigateToRingScreen);

    // Initialize notifications plugin with a callback for alarm response
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // SharedPreferencesHelper.setAlarm(true);
        debugPrint("Callback click notification");
      },
    );

    // Set up method call handler for reboot
    _channel.setMethodCallHandler((call) async {
      if (call.method == "rescheduleAlarms") {
        await rescheduleAlarms();
      }
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    print("Navigasi if ring");
    await Get.toNamed(AppLinks.ALARMSCREEN)?.then((_) {
      AuthenticationRepository.instance.screenRedirect();
    });
  }

  @override
  void dispose() {
    ringSubscription?.cancel();
    super.dispose();
  }

  // static Future<void> init() async {
  //   await Alarm.init();

  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('app_icon');
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );

  //   // Initialize notifications plugin with a callback for alarm response
  //   await flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: (NotificationResponse response) async {
  //       // SharedPreferencesHelper.setAlarm(true);
  //       debugPrint("Callback click notification");
  //     },
  //   );

  //   // Request notification permission using permission_handler
  //   final notificationPermission = await Permission.notification.status;
  //   if (notificationPermission.isDenied) {
  //     await Permission.notification.request();
  //   }

  //   //Request battery optimization and schedule alarm permissions
  //   final statusBattery = await Permission.ignoreBatteryOptimizations.status;
  //   if (statusBattery.isDenied) {
  //     await Permission.ignoreBatteryOptimizations.request();
  //   }

  //   final status = await Permission.scheduleExactAlarm.status;
  //   if (status.isDenied) {
  //     await Permission.scheduleExactAlarm.request();
  //   }

  //   // Set up method call handler for reboot
  //   _channel.setMethodCallHandler((call) async {
  //     if (call.method == "rescheduleAlarms") {
  //       await rescheduleAlarms();
  //     }
  //   });

  //   Alarm.ringStream.stream.listen((alarm) async {
  //     SharedPreferencesHelper.setAlarm(true);
  //     Get.offAllNamed(AppLinks.ALARMSCREEN);
  //   });
  // }

  Future<void> scheduleAlarm() async {
    int? fase = await SharedPreferencesHelper.getFase();
    String? token = await SharedPreferencesHelper.getToken();

    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day, 7, 0);

    if (token != null) {
      if (fase == 1) {
        if ((now.isAfter(dateTime))) {
          dateTime = DateTime(now.year, now.month, now.day + 1, 7, 0);
        }

        final alarmSettings = createAlarmSettings(dateTime);

        await Alarm.set(alarmSettings: alarmSettings).then((_) {
          showNotification('Alarm Fase 1',
              "Alarm telah diatur pada ${DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)}");
        });
      } else if (fase == 2) {
        if (now.weekday == DateTime.tuesday ||
            now.weekday == DateTime.thursday ||
            now.weekday == DateTime.saturday) {
          // If it's the correct day but after 7 AM, move to the next allowed day
          if ((now.isAfter(dateTime))) {
            dateTime = DateTime(now.year, now.month, now.day + 1, 7, 0);
          }

          final alarmSettings = createAlarmSettings(dateTime);
          await Alarm.set(alarmSettings: alarmSettings).then((_) {
            showNotification('Alarm Fase 2',
                "Alarm telah diatur pada ${DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)}");
          });
        } else {
          // Jika hari ini bukan hari yang diizinkan, cari hari selanjutnya yang diizinkan
          dateTime = getNextAllowedDateTime(now);

          final alarmSettings = createAlarmSettings(dateTime);

          // Set alarm
          await Alarm.set(alarmSettings: alarmSettings).then((_) {
            showNotification('Alarm Fase 2',
                "Alarm telah diatur pada ${DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)}");
          });
        }
      }
    }
  }

  Future<void> alarmStop() async {
    await Alarm.stop(1);
  }

  Future<void> snooze30() async {
    await alarmStop();

    // Ambil waktu saat ini dan tambahkan 30 menit
    DateTime snoozeTime = await DateTime.now().add(Duration(minutes: 30));

    await Alarm.set(
      alarmSettings: AlarmSettings(
        id: 1,
        dateTime: snoozeTime,
        assetAudioPath: 'assets/sounds/alarm.mp3',
        loopAudio: true,
        vibrate: true,
        volume: 0.2,
        fadeDuration: 3.0,
        androidFullScreenIntent: true,
        warningNotificationOnKill: Platform.isIOS,
        notificationSettings: const NotificationSettings(
          title: 'Pengingat!!!',
          body: 'Sudah waktunya minum obat, ayo segera minum obat.',
          stopButton: null,
          icon: 'app_icon',
        ),
      ),
    ).then((_) {
      showNotification('Alarm Fase 2',
          "Alarm telah diatur pada ${DateFormat('dd-MMM-yyyy HH:mm').format(snoozeTime)}");
    });
    Get.back();
  }

  AlarmSettings createAlarmSettings(DateTime dateTime) {
    return AlarmSettings(
      id: 1,
      dateTime: dateTime,
      assetAudioPath: 'assets/sounds/alarm.mp3',
      loopAudio: true,
      vibrate: false,
      volume: 0.1,
      fadeDuration: 3.0,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      notificationSettings: const NotificationSettings(
        title: 'Pengingat!!!',
        body: 'Sudah waktunya minum obat, ayo segera minum obat.',
        stopButton: null,
        icon: 'app_icon', // Set payload for navigation
      ),
    );
  }

  DateTime getNextAllowedDateTime(DateTime now) {
    DateTime nextDateTime;
    if (now.weekday < DateTime.tuesday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.tuesday - now.weekday));
    } else if (now.weekday < DateTime.thursday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.thursday - now.weekday));
    } else if (now.weekday < DateTime.saturday) {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: DateTime.saturday - now.weekday));
    } else {
      nextDateTime = DateTime(now.year, now.month, now.day, 7)
          .add(Duration(days: (DateTime.tuesday - now.weekday + 7) % 7));
    }
    return nextDateTime;
  }

  static Future<void> rescheduleAlarms() async {
    await Alarm.stop(1);
    AlarmHelper().scheduleAlarm();
  }

  // Fungsi untuk menampilkan notifikasi
  Future<void> showNotification(String title, String message) async {
    var androidDetails = AndroidNotificationDetails(
      'alarm',
      'channel_alarm',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosDetails = const DarwinNotificationDetails();
    var platformDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Menampilkan notifikasi
    await flutterLocalNotificationsPlugin.show(
        0, title, message, platformDetails);
  }
}
