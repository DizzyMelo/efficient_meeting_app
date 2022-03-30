import 'package:efficient_meeting_app/core/theme/fonts.dart';
import 'package:efficient_meeting_app/modules/home/components/meetings/meeting_row_component.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/response/meeting/meetings_response_model.dart';
import '../../../../core/components/loading_cards_component.dart';

class MeetingListComponent extends StatelessWidget {
  final bool loading;
  final List<Meeting> meetings;
  const MeetingListComponent(
      {Key? key, required this.meetings, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            "Upcoming Meetings",
            style: CustomTextStyles.textTitleBold,
          ),
        ),
        loading
            ? const LoadingCardsComponent()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: meetings
                      .map((meeting) => MeetingRowComponent(meeting: meeting))
                      .toList(),
                ),
              )
      ],
    );
  }
}
