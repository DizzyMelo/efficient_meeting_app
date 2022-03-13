import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:get/get.dart';

import '../../core/api/response/meeting/meetings_response_model.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  var meetingsResponseModel = MeetingsResponseModel(meetings: []).obs;

  final meetingClient = MeetingClient();

  getAllMeetings() async {
    loading.value = true;
    try {
      meetingsResponseModel.value =
          await meetingClient.getAll() as MeetingsResponseModel;
    } catch (e) {
      // GeneralUtils.showMessage(context,
      //     message: 'Something went wrong while retrieving meetings!');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getAllMeetings();
  }
}
