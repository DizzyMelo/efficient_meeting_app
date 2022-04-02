import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/components/custom_buttom.dart';
import '../../../../core/components/loading_cards_component.dart';
import '../../../../core/entities/task_entity.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/general_utils.dart';

class TaskListComponent extends StatelessWidget {
  final bool loading;
  final List<Task> tasks;
  const TaskListComponent(
      {Key? key, required this.tasks, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const LoadingCardsComponent();
    }
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks',
          style: CustomTextStyles.textMedium,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: tasks
                .map(
                  (task) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadiusDirectional.circular(5)),
                      child: Center(
                        child: ListTile(
                          onTap: () => displayTask(context, task),
                          title: Text(task.description!),
                          subtitle: Text(
                              "Due on ${GeneralUtils.formatDate(task.deadLine)}"),
                          trailing: task.completed!
                              ? const Icon(
                                  LineIcons.checkCircle,
                                  color: Colors.green,
                                )
                              : const Icon(LineIcons.hourglass),
                        ),
                      )),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  displayTask(BuildContext context, Task task) {
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
                    task.description!,
                    style: CustomTextStyles.textMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    task.title!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  task.completed!
                      ? const Icon(
                          LineIcons.checkCircle,
                          size: 70,
                          color: Colors.green,
                        )
                      : CustomButtom(
                          title: 'Set Task as Done!',
                          backgroudColor: CustomColors.accent1,
                          function: () {}),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }
}
