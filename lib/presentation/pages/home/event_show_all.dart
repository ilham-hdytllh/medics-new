import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/extension/date.dart';
import 'package:medics/presentation/getx/events/event_controller.dart';
import 'package:medics/routes/navigation_route.dart';

class EventShowAllScreen extends StatelessWidget {
  const EventShowAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.find<EventListController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Event"),
      ),
      body: Obx(() => ListView.builder(
          itemCount: eventController.events.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                onTap: () => Get.toNamed(AppLinks.DETAILEVENT,
                    arguments: eventController.events[index].id),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    eventController.events[index].image,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  eventController.events[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "${eventController.events[index].dateOfEvent.formatDateTime()} ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
