import 'package:efficient_meeting_app/core/entities/user_entity.dart';
import 'package:efficient_meeting_app/core/theme/colors.dart';
import 'package:efficient_meeting_app/modules/participants/binding.dart';
import 'package:efficient_meeting_app/modules/participants/view.dart';
import 'package:efficient_meeting_app/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/circular_button.dart';
import '../../../../core/components/custom_buttom.dart';
import '../../../../core/theme/fonts.dart';
import '../../../task/add/binding.dart';
import '../../../task/add/view.dart';
import '../../../task/list/binding.dart';
import '../../../task/list/view.dart';

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
                              (participant) => InkWell(
                                onTap: () => displayUser(context, participant),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: CustomColors.accent1,
                                        backgroundImage: const AssetImage(
                                            'assets/img/alien.png'),
                                      ),
                                      Text(
                                        participant.firstname,
                                        style: CustomTextStyles.textSmall,
                                      )
                                    ],
                                  ),
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

  displayUser(BuildContext context, User user) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 350,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${user.firstname} ${user.lastname}',
                    style: CustomTextStyles.textMedium,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text(user.email),
                    subtitle: const Text('Email'),
                  ),
                  ListTile(
                    title: Text(user.phone),
                    subtitle: const Text('Phone Number'),
                  ),
                  const SizedBox(height: 20),
                  CustomButtom(
                      title: 'Assign Task',
                      backgroudColor: CustomColors.accent1,
                      function: () {
                        context.read<TaskProvider>().setUserToAddTask(user);
                        Get.to(AddTaskView(), binding: AddTaskBiding());
                      }),
                  const SizedBox(height: 20),
                  const CustomButtom(title: 'Remove Participant')
                ],
              ),
            ),
          );
        });
  }
}
