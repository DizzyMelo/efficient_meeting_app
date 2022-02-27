import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/logo_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                    const CustomTextFieldComponent(label: 'Email'),
                    const CustomTextFieldComponent(label: 'Password'),
                    Obx(
                      () => CustomButtom(
                        title: 'Login',
                        function: controller.login,
                        loading: controller.loading.value,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () => print('nav'),
                        child: const Text('Signup'))
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
