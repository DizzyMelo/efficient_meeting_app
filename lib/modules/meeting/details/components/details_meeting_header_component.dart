import 'package:efficient_meeting_app/core/api/response/meeting/detail_meeting_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';

class DetailsMeetingHeaderComponent extends StatelessWidget {
  final DetailMeetingResponseModel meeting;
  const DetailsMeetingHeaderComponent({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: CustomColors.accent1,
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            foregroundImage: AssetImage("assets/img/alien.png"),
          ),
          const SizedBox(height: 10),
          Text(
            '${meeting.data!.host!.firstname!} (host)',
            style: CustomTextStyles.textMedium,
          ),
        ],
      ),
    );
  }
}
