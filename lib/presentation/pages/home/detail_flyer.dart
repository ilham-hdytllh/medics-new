import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import '../../getx/home/home_controller.dart';

class DetailFlyer extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Flyer"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: WebUri.uri(Uri.parse(Get.arguments))),
          onWebViewCreated: controller.onWebViewCreated,
          onLoadStart: (InAppWebViewController controller, Uri? url) {
            print("Loading started: $url");
          },
          onLoadStop: (InAppWebViewController controller, Uri? url) async {
            print("Loading stopped: $url");
          },
        ),
      ),
    );
  }
}
