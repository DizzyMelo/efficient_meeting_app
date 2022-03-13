import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/logo_component.dart';
import 'package:efficient_meeting_app/modules/signup/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                        label: 'First Name',
                        controller: _firstNameController,
                      ),
                      CustomTextFieldComponent(
                        label: 'Last Name',
                        controller: _lastNameController,
                      ),
                      CustomTextFieldComponent(
                        label: 'Email',
                        controller: _emailController,
                      ),
                      CustomTextFieldComponent(
                        label: 'Phone',
                        controller: _phoneController,
                      ),
                      CustomTextFieldComponent(
                        label: 'Password',
                        controller: _passwordController,
                      ),
                      Obx(
                        () => CustomButtom(
                          title: 'Signup',
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              controller.signup(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          loading: controller.loading.value,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Back'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
