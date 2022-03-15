import 'package:efficient_meeting_app/modules/meeting/details/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/api/response/meeting/meetings_response_model.dart';
import '../../../meeting/details/detail_meeting_view.dart';

class MeetingRowComponent extends StatelessWidget {
  final Meeting meeting;

  const MeetingRowComponent({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(const DetailMeetingView(),
          binding: DetailMeetingBiding(),
          arguments: {'meetingId': meeting.id!}),
      title: Text(meeting.title!),
      subtitle: Text(meeting.description!),
    );
  }
}
