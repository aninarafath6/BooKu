import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:machine_test/services/exception.dart';

class BaseClient {
  BaseClient({required this.baseURL});
  final String baseURL;
  var client = http.Client();

  // get method
  Future<dynamic> get(String api) async {
    Uri uri = Uri.parse(baseURL + api);
    try {
      var response = await client.get(uri);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    }
  }

  // post method
  Future<dynamic> post(String api, dynamic data, {dynamic header}) async {}

  // put method
  Future<dynamic> put(String api) async {}

// process response method
  dynamic _processResponse(http.Response response) {
    var bodyBytes = utf8.decode(response.bodyBytes);
    switch (response.statusCode) {
      case 200:
        var responseJson = bodyBytes;
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        var errors = json.decode(bodyBytes)["errors"];

        throw BadRequestException(
            errors[errors.keys.elementAt(0)][0].toString(),
            response.request?.url.toString());
      case 401:
      case 403:
        var errors = json.decode(bodyBytes)["errors"];

        throw UnAuthorizedException(
            errors[errors.keys.elementAt(0)][0].toString(),
            response.request?.url.toString());

      case 500:
        throw InternalServerException(
            "something went wrong", response.request?.url.toString());
      default:
        throw FetchDataException(
            "Error occur with code : ${response.statusCode}",
            response.request?.url.toString());
    }
  }
}
