import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AddTopicView extends GetView<AddTopicController> {
  AddTopicView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final topicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Add Topic'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: CustomTextFieldComponent(
                    validator: GeneralUtils.defaultTextfieldValidator,
                    maxLines: 3,
                    label: 'Topic',
                    controller: topicController),
              ),
              Obx(
                () => CustomButtom(
                  loading: controller.loading.value,
                  title: 'Add Topic',
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      controller.addTopic(context, topic: topicController.text);
                      topicController.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
