import 'package:efficient_meeting_app/core/utils/config_utils.dart';

class ApiClient {
  final String _baseUrl = ConfigUtils.apiURL!;

  String buildUrl(String endpoint, Map<String, String> queryParams) {
    var apiUri = Uri.parse(_baseUrl);
    final apiPath = "${apiUri.path}/$endpoint";
    final uri = Uri(
            scheme: apiUri.scheme,
            host: apiUri.host,
            path: apiPath,
            queryParameters: queryParams)
        .toString();
    return uri;
  }

  Map buildHeaders({String? token}) {
    Map<String, String> headers = Map();

    return headers;
  }
}
