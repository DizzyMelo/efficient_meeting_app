import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/home/components/home_header_component.dart';
import 'package:efficient_meeting_app/modules/home/components/meetings/meeting_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../meeting/add/binding.dart';
import '../meeting/add/view.dart';
import 'controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.accent2,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeHeaderComponent(),
              Obx(
                () => MeetingListComponent(
                    meetings: controller.meetingsResponseModel.value.meetings!,
                    loading: controller.loading.value),
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
