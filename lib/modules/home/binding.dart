import 'package:get/get.dart';

import 'controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
