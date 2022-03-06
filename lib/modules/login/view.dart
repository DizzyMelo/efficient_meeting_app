import 'package:efficient_meeting_app/core/components/custom_buttom.dart';
import 'package:efficient_meeting_app/core/components/custom_textfield_component.dart';
import 'package:efficient_meeting_app/core/components/logo_component.dart';
import 'package:efficient_meeting_app/modules/signup/binding.dart';
import 'package:efficient_meeting_app/modules/signup/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _loginController =
      TextEditingController(text: "daniel.melo@teste6.com");
  final _passwordController = TextEditingController(text: "12345678");

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
                      label: 'Email',
                      controller: _loginController,
                      validator: controller.validateEmail,
                    ),
                    CustomTextFieldComponent(
                      label: 'Password',
                      controller: _passwordController,
                      validator: controller.validatePassword,
                    ),
                    Obx(
                      () => CustomButtom(
                        title: 'Login',
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(
                                login: _loginController.text,
                                password: _passwordController.text);
                          }
                        },
                        loading: controller.loading.value,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () =>
                            Get.to(SignupView(), binding: SignupBiding()),
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
