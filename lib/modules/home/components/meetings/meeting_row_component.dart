import 'package:flutter/material.dart';

import '../../../../core/api/response/meeting/meetings_response_model.dart';

class MeetingRowComponent extends StatelessWidget {
  final Meeting meeting;

  const MeetingRowComponent({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meeting.title!),
      subtitle: Text(meeting.description!),
    );
  }
}
