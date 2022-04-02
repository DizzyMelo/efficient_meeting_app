import 'package:efficient_meeting_app/core/components/circular_button.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/api/response/meeting/detail_meeting_response_model.dart';
import '../../../../core/theme/fonts.dart';

class TopicsListComponents extends StatelessWidget {
  final List<Topic> topics;
  const TopicsListComponents({Key? key, required this.topics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
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
                    'Topics',
                    style: CustomTextStyles.textMedium,
                  ),
                  CircularButtonComponent(
                      function: () => print('add topic'), icon: LineIcons.plus)
                ],
              ),
              const Divider(),
              topics.isEmpty
                  ? const Center(
                      child: Text('No topic added yet'),
                    )
                  : Column(
                      children: topics
                          .map(
                            (topic) => ListTile(
                              onTap: () => complete(context),
                              title: Text(topic.name!),
                              trailing: topic.completed!
                                  ? const Icon(
                                      LineIcons.checkCircle,
                                      color: Colors.green,
                                    )
                                  : const Icon(LineIcons.hourglass),
                            ),
                          )
                          .toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  complete(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Set this topic as covered!',
                    style: CustomTextStyles.textMedium,
                  ),
                  const SizedBox(height: 20),
                  const CustomButtom(title: 'Topic Completed')
                ],
              ),
            ),
          );
        });
  }
}
