import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/datetime_button_component.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../providers/task_provider.dart';
import 'controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  AddTaskView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            title:
                'Assign Task to ${context.watch<TaskProvider>().user!.firstname}'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFieldComponent(
                  label: 'Task description',
                  controller: _descriptionController,
                  maxLines: 3,
                  validator: GeneralUtils.defaultTextfieldValidator,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateTimeButtonComponent(
                        onPressed: () => controller.requestDateInput(context),
                        title: context
                            .watch<TaskProvider>()
                            .dateToCompleteTaskStr),
                    DateTimeButtonComponent(
                        onPressed: () => controller.requestTimeInput(context),
                        title:
                            context.watch<TaskProvider>().timeToCompleteTaskStr)
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CustomButtom(
                    loading: controller.loading.value,
                    title: 'Assign Task',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        controller.assignTask(context,
                            description: _descriptionController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
