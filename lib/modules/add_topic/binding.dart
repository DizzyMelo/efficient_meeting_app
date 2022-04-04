import 'package:get/get.dart';

import 'controller.dart';

class AddTopicBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTopicController>(() => AddTopicController());
  }
}
