import 'package:efficient_meeting_app/core/components/custom_appbar_component.dart';
import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/modules/participants/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddParticipantView extends GetView<AddParticipantController> {
  AddParticipantView({Key? key}) : super(key: key);
  final userTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Add participant'),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFieldComponent(
                    label: 'Email', controller: userTextController),
                Obx(
                  () => CustomButtom(
                      title: 'Find Participant',
                      loading: controller.loading.value,
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          controller.getUserByEmail(
                              email: userTextController.text);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
