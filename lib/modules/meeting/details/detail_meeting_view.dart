import 'package:efficient_meeting_app/core/components/loading_component.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/modules/meeting/details/components/topics_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/details_meeting_header_component.dart';
import 'components/participants_list_component.dart';
import 'controller.dart';

class DetailMeetingView extends GetView<DetailMeetingController> {
  const DetailMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.loading.value
                    ? const LoadingComponent()
                    : Column(
                        children: [
                          DetailsMeetingHeaderComponent(
                            meeting: controller.meetingResponseModel.value,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  controller
                                      .meetingResponseModel.value.data!.title!,
                                  style: CustomTextStyles.textTitleBold,
                                ),
                                const SizedBox(height: 10),
                                Text(controller
                                    .meetingResponseModel.value.data!.date!
                                    .toString()),
                                const SizedBox(height: 10),
                                Text(
                                  controller
                                      .meetingResponseModel.value.data!.title!,
                                  style: CustomTextStyles.textMedium,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Participants',
                                  style: CustomTextStyles.textTitleRegular,
                                ),
                                ParticipantsListComponents(
                                  participants: controller.meetingResponseModel
                                      .value.data!.participants!,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Topics',
                                  style: CustomTextStyles.textTitleRegular,
                                ),
                                TopicsListComponents(
                                  topics: controller
                                      .meetingResponseModel.value.data!.topics!,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
