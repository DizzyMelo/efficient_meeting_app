import 'package:efficient_meeting_app/core/components/circular_button.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/add_topic/view.dart';
import 'package:efficient_meeting_app/modules/meeting/details/controller.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/response/meeting/detail_meeting_response_model.dart';
import '../../../../core/theme/fonts.dart';
import '../../../add_topic/binding.dart';

class TopicsListComponents extends StatelessWidget {
  final List<Topic> topics;
  final DetailMeetingController controller;
  const TopicsListComponents({
    Key? key,
    required this.topics,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Topics',
                    style: CustomTextStyles.textMedium,
                  ),
                  CircularButtonComponent(
                      function: () async => [
                            await Get.to(AddTopicView(),
                                binding: AddTopicBiding()),
                            controller.getMeeting(context
                                .read<MeetingProvider>()
                                .selectedMeeting!
                                .id!)
                          ],
                      icon: LineIcons.plus)
                ],
              ),
              const Divider(),
              topics.isEmpty
                  ? const Center(
                      child: Text('No topic added yet'),
                    )
                  : Column(
                      children: topics
                          .map(
                            (topic) => ListTile(
                              onTap: () => complete(context, topic),
                              title: Text(topic.name!),
                              trailing: topic.completed!
                                  ? const Icon(
                                      LineIcons.checkCircle,
                                      color: Colors.green,
                                    )
                                  : const Icon(LineIcons.hourglass),
                            ),
                          )
                          .toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  complete(BuildContext context, Topic topic) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 220,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    topic.name!,
                    style: CustomTextStyles.textMedium,
                  ),
                  const SizedBox(height: 20),
                  topic.completed!
                      ? const Icon(
                          LineIcons.checkCircle,
                          color: Colors.green,
                          size: 70,
                        )
                      : Column(
                          children: [
                            Obx(
                              () => CustomButtom(
                                loading: controller.loadingUpdateStatus.value,
                                title: 'Set Topic Completed',
                                backgroudColor: CustomColors.accent1,
                                function: () async => [
                                  await controller.updateTopicStatus(
                                      context, topic.id!, !topic.completed!),
                                  controller.getMeeting(context
                                      .read<MeetingProvider>()
                                      .selectedMeeting!
                                      .id!)
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => CustomButtom(
                                loading: controller.loadingUpdate.value,
                                title: 'Remove Topic',
                                function: () async => [
                                  await controller.removeTopicFromMeeting(
                                      context, topic.id!),
                                  controller.getMeeting(context
                                      .read<MeetingProvider>()
                                      .selectedMeeting!
                                      .id!)
                                ],
                              ),
                            )
                          ],
                        )
                ],
              ),
            ),
          );
        });
  }
}
