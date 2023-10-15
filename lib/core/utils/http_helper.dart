import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dr/core/utils/app_strings.dart';
import 'package:http/http.dart' as http;

import 'app_logger.dart';
import 'cache_helper.dart';
import 'http_custom_exception.dart';

enum RequestState { initial, loading, success, failed }

class ApiBaseHelper {
  final String baseUrl;
  Map<String, String>? baseHeaders;

  ApiBaseHelper(this.baseUrl) {
    baseHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(
        key: AppStrings.userToken,
      )}'
    };
  }
  void updateHeader() {
    baseHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${CacheHelper.getData(
        key: AppStrings.userToken,
      )}'
    };
  }

  Future<Map<String, dynamic>?> get(String url,
      {Map<String, String>? headers}) async {
    Map<String, dynamic>? responseJson;

    Uri urlRequest = Uri.parse(baseUrl + url);
    try {
      print(urlRequest);

      final http.Response response =
          await http.get(urlRequest, headers: headers ?? baseHeaders);
      responseJson =
          _returnResponse(response, url: urlRequest.toString(), request: "GET");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  Future<Map<String, dynamic>?> post(String url,
      {Object? body, Map<String, String>? headers}) async {
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse("https://dev.home-healers.com" + url);
    try {
      final http.Response response = await http.post(urlRequest,
          body: jsonEncode(body), headers: headers ?? baseHeaders);

      responseJson = _returnResponse(response,
          url: urlRequest.toString(), request: "POST");
    } on SocketException catch (e) {
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  ///to upload image
  Future<Map<String, dynamic>?> multiPartRequest(
    String url, {
    required Map<String, String>? body,
    required List<File>? files,
    required String fileKey,
    List<File>? documents,
    String? documentsKey,
    Map<String, String>? headers,
  }) async {
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse(baseUrl + url);
    log(urlRequest.toString());
    try {
      var request = http.MultipartRequest(
        'POST',
        urlRequest,
      );

      request.headers["Content-Type"] = "multipart/form-data";
      request.headers["Accept"] = "application/json";
      request.headers["Authorization"] = 'Bearer ${CacheHelper.getData(
        key: AppStrings.userToken,
      )}';

      //init form data eg,name,description,...
      body?.forEach((key, value) {
        request.fields[key] = value;
      });
      //init file data eg,pdf,img,..
      if (files != null) {
        print(files);
        for (int i = 0; i < files.length; i++) {
          request.files.add(
            await http.MultipartFile.fromPath(
              files.length > 1
                  ? "$fileKey[$i]"
                  : fileKey, //name of field in request api form data
              files[i].path,
            ),
          );
        }
      }
      //init document data eg,pdf,img,..
      if (documents != null) {
        for (int i = 0; i < documents.length; i++) {
          request.files.add(
            await http.MultipartFile.fromPath(
              documents.length > 1
                  ? "$documentsKey[$i]"
                  : documentsKey!, //name of field in request api form data
              documents[i].path,
            ),
          );
        }
      }

      var result = await request.send();

      responseJson = _returnResponse(
          http.Response(
            await result.stream.bytesToString(),
            result.statusCode,
          ),
          url: urlRequest.toString(),
          request: "POST");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  ///to update request
  Future<Map<String, dynamic>?> update(String url,
      {Object? body,
      Map<String, String>? headers,
      Map<String, String>? query}) async {
    Map<String, dynamic>? responseJson;
    Uri urlRequest = Uri.parse(baseUrl + url).replace(queryParameters: query);
    try {
      final http.Response response = await http.put(urlRequest,
          body: body, headers: headers ?? baseHeaders);
      responseJson = _returnResponse(response,
          url: urlRequest.toString(), request: "POST");
    } on SocketException {
      throw FetchDataException('لا يوجد اتصال بالانترنت');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response,
      {required String url, String? request}) {
    ResponseFailure? error;
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        logger.i(
            "REQUEST[$request] StatusCode[${response.statusCode}]=> PATH: $url"
            "=> REQUEST VALUES: $responseJson => HEADERS: ${response.headers}");
        return responseJson;
      case 201 || 202:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        logger.i(
            "REQUEST[$request] StatusCode[${response.statusCode}]=> PATH: $url"
            "=> REQUEST VALUES: $responseJson => HEADERS: ${response.headers}");
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['message'] != null) {
          error = ResponseFailure.fromJson(responseJson);
        } else {
          error = ResponseFailure(
              success: false,
              message: response.body.toString(),
              data: ErrorData(descAr: []));
        }
        logger.i("RESPONSE[${response.statusCode}] => DATA: ${response.body}");
        throw BadRequestException(error);
      case 401:
      case 403:
      case 422:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['message'] != null) {
          error = ResponseFailure.fromJson(responseJson);
        } else {
          error = ResponseFailure(
              success: false,
              message: response.body.toString(),
              data: ErrorData(descAr: []));
        }
        logger.i(
            "REQUEST[$request] => PATH: $url RESPONSE[${response.statusCode}] => DATA: ${response.body}");
        throw UnauthorisedException(error);
      case 500:
      default:
        logger.i(
            "REQUEST [$request] => PATH: $url => \nSTATUS CODE[${response.statusCode}] => \nDATA: ${response.body}");
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
