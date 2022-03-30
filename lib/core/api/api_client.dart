import 'package:dio/dio.dart';
import 'package:efficient_meeting_app/core/api/response/error/default_api_error_response.dart';
import 'package:efficient_meeting_app/core/api/response/response_object.dart';
import 'package:efficient_meeting_app/core/api/response/user_reponse_model.dart';
import 'package:efficient_meeting_app/core/exceptions/api_exception.dart';
import 'package:efficient_meeting_app/core/exceptions/unexpected_exception.dart';
import 'package:efficient_meeting_app/core/utils/config_utils.dart';

import 'api_error.dart';
import 'api_response.dart';

final dio = Dio();

class ApiClient {
  final String _baseUrl = ConfigUtils.apiURL!;

  Future<ResponseObject> get({
    required String endpoint,
    Map<String, String>? queryParams,
    String? preferredUrl,
    Map<String, dynamic>? headers,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  }) async {
    String url = buildUrl(
        endpoint: endpoint,
        queryParams: queryParams,
        preferredUrl: preferredUrl);

    Map<String, dynamic>? requestHeaders = buildHeaders();
    if (headers != null) {
      requestHeaders?.addAll(headers);
    }

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: requestHeaders,
        ),
      );
      ApiResponse apiResponse = handleResponse(response);

      return serializer(apiResponse.body);
    } on ApiError {
      rethrow;
    } on DioError catch (ex) {
      throw ApiException(
          ApiError(detail: ex.error.toString()), ex.response!.statusCode!);
    } catch (ex) {
      throw CustomException("Something is wrong with your request!", ex, 500);
    }
  }

  Future<ResponseObject> post(
      {required String endpoint,
      required ResponseObject Function(Map<String, dynamic>) serializer,
      Map? body,
      Map<String, dynamic>? headers,
      String? token,
      String? preferredUrl}) async {
    final String url = buildUrl(endpoint: endpoint, preferredUrl: preferredUrl);
    Map<String, dynamic>? requestHeaders = buildHeaders();
    if (headers != null) {
      requestHeaders?.addAll(headers);
    }
    try {
      final Response response = await dio.post(
        url,
        options: Options(headers: requestHeaders),
        data: body,
      );

      ApiResponse apiResponse = handleResponse(response);

      return serializer(apiResponse.body);
    } on ApiException {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      rethrow;
    } on DioError catch (ex) {
      handleError(ex.response!);
      DefaultApiErrorResponse error =
          DefaultApiErrorResponse.fromJson(ex.response!.data);
      throw CustomException(error.message!, ex, ex.response?.statusCode ?? -1);
    } catch (ex) {
      throw CustomException("Something is wrong with your request", ex, 500);
    }
  }

  ApiResponse handleResponse(Response response) {
    // logger.logVerbose('Response for ' +
    //     response.request.path +
    //     '\nStatus code: ' +
    //     response.statusCode.toString() +
    //     '\nBody:\n' +
    //     response.data.toString());

    Map<String, dynamic> body = {};
    if (response.data.isNotEmpty) {
      body = response.data;
    }

    final apiResponse = ApiResponse(response.statusCode!, body);

    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      handleError(response);
      ApiError error = ApiError.fromJson(apiResponse.body);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

  Map<String, dynamic>? buildHeaders() {
    Map<String, String> headers = {};

    headers["Accept"] = "application/json";
    headers["ContentType"] = "application/json";

    if (UserResponseModel.loginResponse != null) {
      headers["Authorization"] =
          "Bearer ${UserResponseModel.loginResponse!.token}";
    }

    return headers;
  }

  String buildUrl({
    required String endpoint,
    Map<String, String>? queryParams,
    String? preferredUrl,
  }) {
    var apiUri =
        preferredUrl != null ? Uri.parse(preferredUrl) : Uri.parse(_baseUrl);
    final apiPath = apiUri.path + "/" + endpoint;
    final uri = Uri(
            scheme: apiUri.scheme,
            host: apiUri.host,
            path: apiPath,
            queryParameters: queryParams)
        .toString();
    return uri;
  }

  void handleError(Response response) {}
}
