import 'package:efficient_meeting_app/core/api/clients/meeting_client.dart';
import 'package:efficient_meeting_app/core/api/response/meeting/detail_meeting_response_model.dart';
import 'package:efficient_meeting_app/core/utils/general_utils.dart';
import 'package:get/get.dart';

class DetailMeetingController extends GetxController {
  var loading = false.obs;
  var counter = 0.obs;
  var meetingResponseModel = DetailMeetingResponseModel().obs;
  late String meetingId;

  final meetingClient = MeetingClient();

  getMeeting(String meetingId) async {
    loading.value = true;
    try {
      meetingResponseModel.value =
          await meetingClient.getOne(meetingId) as DetailMeetingResponseModel;
      print(meetingResponseModel.value.status);
    } catch (e) {
      GeneralUtils.showMessage(
          message: 'Something went wrong when trying to add meeting!');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getMeeting(Get.arguments['meetingId']);
  }
}
