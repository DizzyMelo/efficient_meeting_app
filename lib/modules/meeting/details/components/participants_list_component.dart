import 'package:flutter/material.dart';

class ParticipantsListComponents extends StatelessWidget {
  final List<dynamic> participants;
  const ParticipantsListComponents({Key? key, required this.participants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return const Center(
        child: Text('No participant added yet'),
      );
    }

    return Column(
      children:
          participants.map((e) => const Text('Participant Name')).toList(),
    );
  }
}
