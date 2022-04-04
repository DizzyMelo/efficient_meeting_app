import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/loading_meeting_detail_component.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/modules/meeting/details/components/topics_list_component.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'components/details_meeting_header_component.dart';
import 'components/participants_list_component.dart';
import 'controller.dart';

class DetailMeetingView extends GetView<DetailMeetingController> {
  const DetailMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.accent2,
        appBar: const CustomAppBar(
          title: 'Details',
        ),
        body: RefreshIndicator(
            backgroundColor: CustomColors.primary,
            color: CustomColors.accent2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => controller.loading.value
                        ? const LoadingMeetingDetailComponent()
                        : Column(
                            children: [
                              DetailsMeetingHeaderComponent(
                                meeting: controller.meetingResponseModel.value,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.meetingResponseModel.value
                                          .data!.title!,
                                      style: CustomTextStyles.textTitleBold,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      controller.meetingResponseModel.value
                                          .data!.description!,
                                      style: CustomTextStyles.textSmall,
                                    ),
                                  ],
                                ),
                              ),
                              ParticipantsListComponents(
                                meetingId: controller.meetingId.value,
                                participants: controller.meetingResponseModel
                                    .value.data!.participants!,
                              ),
                              TopicsListComponents(
                                controller: controller,
                                topics: controller
                                    .meetingResponseModel.value.data!.topics!,
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
            onRefresh: () => controller.getMeeting(
                context.read<MeetingProvider>().selectedMeeting!.id!)),
      ),
    );
  }
}
