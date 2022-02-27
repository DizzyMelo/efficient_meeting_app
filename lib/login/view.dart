import 'package:efficient_meeting_app/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Column(
          children: [
            Form(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(),
                    ElevatedButton(
                      onPressed: controller.login,
                      child: Text(
                          controller.loading.value ? 'Carregango' : 'Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
