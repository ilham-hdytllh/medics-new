import 'package:get/get.dart';
import 'package:medics/data/models/news.dart';
import 'package:medics/data/repositories/news/news_repository.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';

class NewsDetailController extends GetxController {
  static NewsDetailController get instance => Get.find();

  // Variable
  RxBool isLoading = false.obs;
  Rx<NewsModel?> newsDetail = Rx<NewsModel?>(null);

  @override
  void onInit() {
    final int newsId = Get.arguments;
    fetchNewsDetail(newsId);
    super.onInit();
  }

  Future<void> fetchNewsDetail(int newsId) async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      String? token = await SharedPreferencesHelper.getToken();
      NewsModel detailNews = await NewsRepository.instance.getNewsDetail(
        token!,
        newsId,
      );
      newsDetail.value = detailNews;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
