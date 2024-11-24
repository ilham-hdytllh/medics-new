import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/presentation/getx/news/news_controller.dart';

import '../../../routes/navigation_route.dart';

class NewsShowAllScreen extends StatelessWidget {
  const NewsShowAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.find<NewsListController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("All News"),
      ),
      body: Obx(() => ListView.builder(
          itemCount: newsController.news.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Get.toNamed(AppLinks.DETAILNEWS,
                  arguments: newsController.news[index].id),
              minTileHeight: 100,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  newsController.news[index].image,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                newsController.news[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          })),
    );
  }
}
