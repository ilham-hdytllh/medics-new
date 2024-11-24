import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/image_strings.dart';
import 'package:medics/core/constants/sizes.dart';
import 'package:medics/core/utils/extension/date.dart';
import 'package:medics/presentation/getx/flyer/flyer_controller.dart';
import 'package:medics/presentation/getx/news/news_controller.dart';
import 'package:medics/routes/navigation_route.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/colors.dart';
import '../../getx/events/event_controller.dart';

class HomeScreen extends StatelessWidget {
  final flyerController = Get.put(FlyerController());
  final newsController = Get.put(NewsListController());
  final eventController = Get.put(EventListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Image.asset(
          CustomImages.logo,
          height: 120,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: CustomColors.white,
        color: CustomColors.primary,
        onRefresh: () async {
          await flyerController.fetchFlyer();
          await newsController.fetchNews();
          await eventController.fetchEvent();
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: CustomSizes.spaceBtwSections),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tuberculosis\nReminder\nTB-R",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Image.asset(
                          CustomImages.doctor,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (flyerController.isLoading.value) {
                    return CarouselSlider.builder(
                      itemCount: 4,
                      options: CarouselOptions(
                        height: 160,
                        aspectRatio: 16 / 8,
                        viewportFraction: 0.8, // Show adjacent items
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        disableCenter: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, onPageChanged) {},
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) =>
                          Shimmer.fromColors(
                        baseColor: CustomColors.errorBg,
                        highlightColor: CustomColors.lightGrey,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    );
                  } else if (flyerController.flyers.isEmpty) {
                    return SizedBox();
                  } else {
                    return CarouselSlider.builder(
                      itemCount: flyerController.flyers.length,
                      options: CarouselOptions(
                        height: 180,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8, // Show adjacent items
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        disableCenter: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, onPageChanged) {},
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) =>
                          GestureDetector(
                        onTap: () => Get.toNamed(AppLinks.DETAILFLYER,
                            arguments: flyerController.flyers[index].url),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        flyerController.flyers[index].image,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Shimmer.fromColors(
                                      baseColor: CustomColors.errorBg,
                                      highlightColor: CustomColors.lightGrey,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: CustomColors.errorBg,
                                        child: Center(
                                          child: Icon(
                                            IconlyLight.dangerCircle,
                                            size: CustomSizes.iconMd,
                                            color: CustomColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      color: CustomColors.errorBg,
                                      child: Center(
                                        child: Icon(
                                          IconlyLight.dangerCircle,
                                          size: CustomSizes.iconMd,
                                          color: CustomColors.black,
                                        ),
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(bottom: 30, left: 10),
                                  alignment: Alignment.centerLeft,
                                  height:
                                      80, // Set the height to be the same for all items
                                  decoration: BoxDecoration(
                                    color: CustomColors.white.withOpacity(0.6),
                                  ),
                                  child: Text(
                                    flyerController.flyers[index].title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: CustomSizes.spaceBtwItems,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Events",
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppLinks.ALLEVENT),
                        child: Text(
                          "Lihat Semua",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: CustomColors.primary,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: CustomSizes.spaceBtwInputFields,
                ),
                Obx(() {
                  if (eventController.isLoading.value) {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 5),
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Shimmer.fromColors(
                                baseColor: CustomColors.errorBg,
                                highlightColor: CustomColors.lightGrey,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: 260,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: CustomColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (eventController.events.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Center(
                        child: Text("Tidak ada event saat ini"),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: eventController.events.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(AppLinks.DETAILEVENT,
                                  arguments: eventController.events[index].id),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 260,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    // Image that fills the entire container
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            eventController.events[index].image,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Shimmer.fromColors(
                                          baseColor: CustomColors.errorBg,
                                          highlightColor:
                                              CustomColors.lightGrey,
                                          child: Container(
                                            width: 260,
                                            height: 150,
                                            color: CustomColors.errorBg,
                                            child: Center(
                                              child: Icon(
                                                IconlyLight.dangerCircle,
                                                size: CustomSizes.iconMd,
                                                color: CustomColors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width: 260,
                                          height: 150,
                                          color: CustomColors.errorBg,
                                          child: Center(
                                            child: Icon(
                                              IconlyLight.dangerCircle,
                                              size: CustomSizes.iconMd,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                        width: 260,
                                        height: 150,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: 10, left: 10),
                                        alignment: Alignment.bottomLeft,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: CustomColors.white
                                              .withOpacity(0.6),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              eventController
                                                  .events[index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  IconlyLight.calendar,
                                                  size: 17,
                                                  color: CustomColors.black,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  eventController
                                                      .events[index].dateOfEvent
                                                      .formatDateTime(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
                SizedBox(
                  height: CustomSizes.spaceBtwItems,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "News",
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppLinks.ALLNEWS),
                        child: Text(
                          "Lihat Semua",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: CustomColors.primary,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: CustomSizes.spaceBtwInputFields,
                ),
                Obx(() {
                  if (newsController.isLoading.value) {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 5),
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Shimmer.fromColors(
                                baseColor: CustomColors.errorBg,
                                highlightColor: CustomColors.lightGrey,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: 260,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: CustomColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (newsController.news.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Center(
                        child: Text("Tidak ada berita saat ini"),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: newsController.news.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(AppLinks.DETAILNEWS,
                                  arguments: newsController.news[index].id),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 260,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    // Image that fills the entire container
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            newsController.news[index].image,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Shimmer.fromColors(
                                          baseColor: CustomColors.errorBg,
                                          highlightColor:
                                              CustomColors.lightGrey,
                                          child: Container(
                                            width: 260,
                                            height: 150,
                                            color: CustomColors.errorBg,
                                            child: Center(
                                              child: Icon(
                                                IconlyLight.dangerCircle,
                                                size: CustomSizes.iconMd,
                                                color: CustomColors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width: 260,
                                          height: 150,
                                          color: CustomColors.errorBg,
                                          child: Center(
                                            child: Icon(
                                              IconlyLight.dangerCircle,
                                              size: CustomSizes.iconMd,
                                              color: CustomColors.black,
                                            ),
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                        width: 260,
                                        height: 150,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: 10, left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: CustomColors.white
                                              .withOpacity(0.6),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              newsController.news[index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
