import 'package:efficient_meeting_app/core/components/circular_button.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/api/response/meeting/meetings_response_model.dart';
import '../../../../core/components/circular_button_placeholder.dart';
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
            // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Expandable(
              collapsed: ExpandableButton(
                child: ListTile(
                    title: Text(
                      meeting.title!,
                      style: CustomTextStyles.textMediumBold,
                    ),
                    subtitle: Text(
                      GeneralUtils.formatDate(meeting.date),
                      style: CustomTextStyles.textSmall,
                    ),
                    trailing: const Icon(Icons.arrow_downward)
                    // trailing: CircularButtonComponent(
                    //     function: () => Get.to(const DetailMeetingView(),
                    //         binding: DetailMeetingBiding(),
                    //         arguments: {'meetingId': meeting.id!}),
                    //     icon: Icons.arrow_forward_ios),
                    ),
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
                    const SizedBox(height: 20),
                    CustomButtom(
                      title: 'Details',
                      function: () => Get.to(const DetailMeetingView(),
                          binding: DetailMeetingBiding(),
                          arguments: {'meetingId': meeting.id!}),
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
