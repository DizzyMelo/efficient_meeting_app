import 'package:efficient_meeting_app/core/entities/user_entity.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/participants/binding.dart';
import 'package:efficient_meeting_app/modules/participants/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/circular_button.dart';
import '../../../../core/theme/fonts.dart';

class ParticipantsListComponents extends StatelessWidget {
  final String meetingId;
  final List<User> participants;
  const ParticipantsListComponents(
      {Key? key, required this.participants, required this.meetingId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 5,
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
                    'Participants',
                    style: CustomTextStyles.textMedium,
                  ),
                  CircularButtonComponent(
                      function: () => Get.to(
                          AddParticipantView(meetingId: meetingId),
                          binding: AddParticipantBiding()),
                      icon: Icons.add)
                ],
              ),
              const Divider(),
              participants.isEmpty
                  ? const Center(
                      child: Text('No participant added yet'),
                    )
                  : SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: participants
                            .map(
                              (participant) => Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: CustomColors.accent1,
                                    ),
                                    Text(
                                      participant.firstname,
                                      style: CustomTextStyles.textSmall,
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
