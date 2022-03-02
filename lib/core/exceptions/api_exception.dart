import 'package:efficient_meeting_app/core/api/api_error.dart';

import 'user_friendly_exception.dart';

class ApiException implements UserFriendlyException {
  ApiError error;
  int statusCode;

  ApiException(this.error, this.statusCode);

  @override
  String getUserFriendlyMessage() {
    return error.detail;
  }

  @override
  String toString() {
    return getUserFriendlyMessage();
  }

  @override
  int getCode() {
    return statusCode;
  }
}
