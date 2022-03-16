import 'package:efficient_meeting_app/core/api/response/meeting/detail_meeting_response_model.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/general_utils.dart';

class DetailsMeetingHeaderComponent extends StatelessWidget {
  final DetailMeetingResponseModel meeting;
  const DetailsMeetingHeaderComponent({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: CustomColors.accent1,
      height: 270,
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
          const SizedBox(height: 10),
          Text(
            GeneralUtils.formatDate(meeting.data!.date).toString(),
            style: CustomTextStyles.textSmall,
          ),
          const SizedBox(height: 20),
          const CustomButtom(title: 'Start Meeting')
        ],
      ),
    );
  }
}
