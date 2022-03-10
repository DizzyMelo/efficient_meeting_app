import 'package:efficient_meeting_app/core/api/api_client.dart';

import '../response/meetings_response_model.dart';
import '../response/response_object.dart';

class MeetingClient extends ApiClient {
  final _baseEndpoint = "meetings";
  Future<ResponseObject> getAll() async {
    var response = await super.get(
        endpoint: _baseEndpoint, serializer: MeetingsResponseModel.fromJson);

    return response;
  }
}
