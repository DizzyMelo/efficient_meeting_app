import 'package:efficient_meeting_app/core/api/clients/user_client.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;

  final userClient = UserClient();
}
