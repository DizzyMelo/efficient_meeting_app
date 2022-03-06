import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/logo_component.dart';
import 'package:efficient_meeting_app/modules/signup/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFieldComponent(
                      label: 'Name',
                      controller: _nameController,
                    ),
                    CustomTextFieldComponent(
                      label: 'Email',
                      controller: _emailController,
                    ),
                    CustomTextFieldComponent(
                      label: 'Password',
                      controller: _passwordController,
                    ),
                    Obx(
                      () => CustomButtom(
                        title: 'Signup',
                        function: controller.signup,
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
