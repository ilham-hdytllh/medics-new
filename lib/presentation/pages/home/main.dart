import 'package:flutter/material.dart';
import 'home.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final pagesController = Get.put(HomeController());
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
