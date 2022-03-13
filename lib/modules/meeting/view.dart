import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/logo_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MeetingView extends GetView<MeetingController> {
  MeetingView({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _durationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const LogoComponent(
              margin: EdgeInsets.symmetric(vertical: 40),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFieldComponent(
                      label: 'Title',
                      controller: _titleController,
                    ),
                    CustomTextFieldComponent(
                      label: 'Description',
                      controller: _descriptionController,
                    ),
                    CustomTextFieldComponent(
                      label: 'Date',
                      controller: _dateController,
                    ),
                    CustomTextFieldComponent(
                      label: 'Duration (min)',
                      controller: _durationController,
                    ),
                    Obx(
                      () => CustomButtom(
                        title: 'Add Meeting',
                        function: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        loading: controller.loading.value,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () => Get.back(), child: const Text('Back'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
