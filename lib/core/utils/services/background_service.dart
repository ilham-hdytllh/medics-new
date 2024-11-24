import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

import '../helpers/alarm_helper.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // Configure service settings for Android and iOS
  service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,       // onStart is called when service starts
      autoStart: true,        // Service auto-starts
      isForegroundMode: true, // Run in foreground mode (useful for keeping the service alive)
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,        // Auto start on iOS
      onForeground: onStart,  // Called when app is in the foreground
      onBackground: onIosBackground,  // Called when app is in the background on iOS
    ),
  );

  await service.startService();  // Start the service
}

// Function that will run when the background service starts
void onStart(ServiceInstance service) {
  // Set background task (e.g., every 15 seconds)
  service.on('setAsForeground').listen((event) {
    callback();
  });

  // Run a periodic timer to perform a task every 15 seconds
  Timer.periodic(const Duration(seconds: 15), (timer) async {
    if (service is AndroidServiceInstance) {
      // Update background notification
      service.setForegroundNotificationInfo(
        title: "Background Service",
        content: "Service is running",
      );
    }

    // Example log for debugging
    print('Service running in the background');
  });
}

// Background task for iOS (ensure it's executed in the background)
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  service.on('task').listen((event) {
    callback();
  });

  // Schedule periodic task for iOS every 50 seconds
  Timer.periodic(const Duration(seconds: 50), (timer) {
    service.invoke('task');
  });

  return true;
}

void callback() async {
  try {
    AlarmHelper alarm = AlarmHelper();
    await alarm.scheduleAlarm();  // Call your alarm function
    print('Executing background task');
  } catch (e) {
    print('Error retrieving data: $e');  // Error handling
  }
}
