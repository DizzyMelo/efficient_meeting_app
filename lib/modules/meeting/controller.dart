import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/response/meetings_response_model.dart';
import 'package:get/get.dart';

class MeetingController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  var meetingsResponseModel = MeetingsResponseModel(meetings: []).obs;

  final userClient = MeetingClient();

  void add(title, description, date, duration) async {
    loading.value = true;
    Meeting response = await userClient.add(
      title: title,
      description: description,
      date: date,
      duration: duration,
    ) as Meeting;

    loading.value = false;

    if (response.status == 'success') {}
  }

  final meetingClient = MeetingClient();

  getAllMeetings() async {
    loading.value = true;
    try {
      meetingsResponseModel.value =
          await meetingClient.getAll() as MeetingsResponseModel;
    } catch (e) {
    } finally {
      loading.value = false;
    }
  }
}
