import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Variable
  RxInt currentPage = 0.obs;
  final pageController = PageController();
  late InAppWebViewController webViewController;

  void changePage(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
  }
}
