import 'package:get/get.dart';

import 'controller.dart';

class AddTaskBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
  }
}
