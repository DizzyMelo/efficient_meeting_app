import 'package:badges/badges.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/home/components/home_header_component.dart';
import 'package:efficient_meeting_app/modules/home/components/meetings/meeting_list_component.dart';
import 'package:efficient_meeting_app/modules/notifications/binding.dart';
import 'package:efficient_meeting_app/modules/notifications/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/components/custom_appbar_component.dart';
import '../meeting/add/binding.dart';
import '../meeting/add/view.dart';
import 'components/home_toggle_button_component.dart';
import 'components/tasks/task_list_component.dart';
import 'controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.accent2,
        appBar: CustomAppBar(
          title: '',
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 2, end: 3),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () => Get.to(const NotificationsView(),
                      binding: NotificationBiding()),
                  icon: const Icon(LineIcons.bell)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeHeaderComponent(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.grey[200],
                ),
                height: 40,
                child: Obx(
                  () => Row(
                    children: [
                      HomeToggleButtonComponent(
                        title: 'Meeings',
                        isSelected: controller.showMeeting.value,
                        isLeft: true,
                        onPressed: () => controller.toggleShowMeetingTask(true),
                      ),
                      HomeToggleButtonComponent(
                        title: 'Tasks',
                        isSelected: !controller.showMeeting.value,
                        isLeft: false,
                        onPressed: () =>
                            controller.toggleShowMeetingTask(false),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: controller.showMeeting.value
                      ? MeetingListComponent(
                          meetings: controller.meetings,
                          loading: controller.loading.value,
                        )
                      : TaskListComponent(
                          loading: controller.loadingTasks.value,
                          tasks: controller.tasks,
                        ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                Get.to(AddMeetingView(), binding: AddMeetingBiding()),
            child: const Icon(Icons.add)),
      ),
    );
  }
}
