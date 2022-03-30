import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/loading_cards_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'components/task_header_component.dart';
import 'controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Tasks'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TaskHeaderComponent(),
              Obx(
                () => controller.loading.value
                    ? const LoadingCardsComponent()
                    : Column(
                        children: controller.tasks
                            .map(
                              (task) => ListTile(
                                title: Text(task.title!),
                                subtitle: Text(task.description!),
                                trailing: task.completed!
                                    ? const Icon(LineIcons.check)
                                    : const Icon(LineIcons.hourglass),
                              ),
                            )
                            .toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
