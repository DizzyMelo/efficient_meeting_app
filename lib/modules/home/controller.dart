import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/response/meetings_response_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;

  final meetingClient = MeetingClient();

  getAllMeetings() async {
    return meetingClient.getAll() as MeetingsResponseModel;
  }
}
