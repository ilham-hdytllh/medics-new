import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/utils/extension/date.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/sizes.dart';
import '../../getx/events/event_detail_controller.dart';

class EventDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Event"),
      ),
      body: GetX<EventDetailController>(
        init: EventDetailController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: CustomColors.primary,
              ),
            );
          }

          final eventDetail = controller.eventDetail.value;

          if (eventDetail == null) {
            return Center(child: Text("No data found"));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventDetail.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        "${eventDetail.dateOfEvent.formatDateTime()} - ${eventDetail.location}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: eventDetail.image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Shimmer.fromColors(
                        baseColor: CustomColors.errorBg,
                        highlightColor: CustomColors.lightGrey,
                        child: Container(
                          width: 270,
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
                      errorWidget: (context, url, error) => Container(
                        width: 270,
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
                      width: 270,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  HtmlWidget(
                    eventDetail.description ?? "",
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
