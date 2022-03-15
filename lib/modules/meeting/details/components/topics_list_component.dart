import 'package:flutter/material.dart';

import '../../../../core/api/response/meeting/detail_meeting_response_model.dart';

class TopicsListComponents extends StatelessWidget {
  final List<Topic> topics;
  const TopicsListComponents({Key? key, required this.topics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) {
      return const Center(
        child: Text('No topic added yet'),
      );
    }

    return Column(
      children: topics.map((topic) => Text(topic.name!)).toList(),
    );
  }
}
