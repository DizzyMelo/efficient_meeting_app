import 'package:flutter/material.dart';

import '../../../../core/components/circular_button.dart';
import '../../../../core/theme/fonts.dart';

class ParticipantsListComponents extends StatelessWidget {
  final List<dynamic> participants;
  const ParticipantsListComponents({Key? key, required this.participants})
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
                      function: () => print('add topic'), icon: Icons.add)
                ],
              ),
              const Divider(),
              participants.isEmpty
                  ? const Center(
                      child: Text('No participant added yet'),
                    )
                  : Column(
                      children: participants
                          .map((e) => const Text('Participant Name'))
                          .toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
