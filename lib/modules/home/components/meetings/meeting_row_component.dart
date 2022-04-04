import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:efficient_meeting_app/providers/meeting_provider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../core/entities/meeting_entity.dart';
import '../../../meeting/details/binding.dart';
import '../../../meeting/details/detail_meeting_view.dart';

class MeetingRowComponent extends StatelessWidget {
  final Meeting meeting;

  const MeetingRowComponent({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5)),
            child: Expandable(
              collapsed: ExpandableButton(
                child: ListTile(
                    title: Text(
                      meeting.title!,
                    ),
                    subtitle: Text(
                      GeneralUtils.formatDate(meeting.date),
                    ),
                    trailing: const Icon(Icons.arrow_downward)),
              ),
              expanded: ExpandableButton(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        meeting.title!,
                        style: CustomTextStyles.textMediumBold,
                      ),
                      subtitle: Text(
                        meeting.description!,
                        style: CustomTextStyles.textSmall,
                      ),
                      trailing: const Icon(Icons.arrow_upward_outlined),
                    ),
                    ListTile(
                      title: Text(
                        'Date',
                        style: CustomTextStyles.textMediumBold,
                      ),
                      trailing: Text(GeneralUtils.formatDate(meeting.date),
                          style: CustomTextStyles.textSmall),
                    ),
                    ListTile(
                      title: Text(
                        'Participants',
                        style: CustomTextStyles.textMediumBold,
                      ),
                      trailing: Text('${meeting.participants!.length}',
                          style: CustomTextStyles.textSmall),
                    ),
                    ListTile(
                      title: Text(
                        'Topics',
                        style: CustomTextStyles.textMediumBold,
                      ),
                      trailing: Text('${meeting.topics!.length}',
                          style: CustomTextStyles.textSmall),
                    ),
                    const SizedBox(height: 20),
                    CustomButtom(
                      title: 'Details',
                      function: () {
                        context.read<MeetingProvider>().setMeeting(meeting);
                        Get.to(const DetailMeetingView(),
                            binding: DetailMeetingBiding(),
                            arguments: {'meetingId': meeting.id!});
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
