// import 'dart:ui';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;

// class NotificationHelper {
//   static final _notification = FlutterLocalNotificationsPlugin();

//   static init() async {
//     _notification.initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//         iOS: DarwinInitializationSettings(),
//       ),
//     );

//     tz.initializeTimeZones();

//     _notification
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestNotificationsPermission();
//   }

//   // Fungsi untuk menampilkan notifikasi langsung dengan suara alarm dan tombol Stop
//   static showInstantNotification(String title, String body) async {
//     var androidDetails = AndroidNotificationDetails(
//       'alarm',
//       'channel_alarm',
//       importance: Importance.max,
//       priority: Priority.high,
//       // ongoing: true,
//       sound: UriAndroidNotificationSound(
//           "assets/sounds/alarm.mp3"), // Suara alarm berulang
//       audioAttributesUsage:
//           AudioAttributesUsage.alarm, // Menjadikan ini sebagai alarm
//       timeoutAfter: 60000, // Suara akan berhenti setelah 1 menit (60000 ms)
//       actions: <AndroidNotificationAction>[
//         AndroidNotificationAction(
//           'stop_action',
//           'Stop Alarm',
//           cancelNotification: true, // Menghentikan notifikasi ketika ditekan
//         ),
//       ],
//     );

//     var iosDetails = const DarwinNotificationDetails();

//     var notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iosDetails);

//     // Menampilkan notifikasi langsung
//     await _notification.show(
//       0, // ID notifikasi
//       title,
//       body,
//       notificationDetails,
//     );
//   }

//   // Fungsi untuk membatalkan notifikasi berdasarkan ID
//   static cancelNotification(int id) async {
//     await _notification.cancel(id);
//   }

//   // Fungsi notif schedule
//   static scheduleNotification(String title, String body) async {
//     var androidDetails = AndroidNotificationDetails(
//       'important_notification',
//       'My Channel',
//       importance: Importance.max,
//       priority: Priority.high,
//       actions: <AndroidNotificationAction>[
//         AndroidNotificationAction('stop_action', 'Stop Alarm',
//             cancelNotification: true),
//       ],
//     );

//     var iosDetails = const DarwinNotificationDetails();

//     var notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iosDetails);

//     _notification.zonedSchedule(
//         0,
//         title,
//         body,
//         tz.TZDateTime.now(tz.local).add(
//           const Duration(seconds: 5),
//         ),
//         notificationDetails,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
//   }
// }
