import 'package:get/get.dart';

import 'controller.dart';

class TaskBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
