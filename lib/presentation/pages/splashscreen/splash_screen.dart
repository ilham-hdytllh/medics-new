import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/data/repositories/authentication/authentication_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Start the screen redirect after a delay
    Timer(const Duration(seconds: 2), () {
      Get.find<AuthenticationRepository>().screenRedirect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/logos/logo.png'), // Display the logo
          ),
          // Loading indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(), // Loading spinner
            ),
          ),
        ],
      ),
    );
  }
}
