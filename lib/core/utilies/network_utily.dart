import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:new_quiz/core/enums/request_type.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'package:http_parser/http_parser.dart';


class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required requestType type,
    required String url,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      var uri = Uri.https(baseUrl, url, params);
       http.Response response;

      Map<String, dynamic> jsonRespons = {};

      switch (type) {
        case requestType.GET:
          response =  await client.get(uri, headers: headers);
          break;
        case requestType.POST:
          response =
          await client.post(uri, headers: headers, body: jsonEncode(body));
          break;
        case requestType.PUT:
          response =
          await client.put(uri, headers: headers, body: jsonEncode(body));
          break;
        case requestType.DELETE:
          response = await client.delete(uri,
              headers: headers, body: jsonEncode(body));
          break;
      }

// Map<String,dynamic> ?result
        dynamic ? result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {}

      jsonRespons.putIfAbsent('statusCode', () => response.statusCode);
      jsonRespons.putIfAbsent(
          'response',

              () => result != null  //result
              ? jsonDecode(utf8.decode(response.bodyBytes))
              : {'title': utf8.decode(response.bodyBytes)});


      return jsonRespons;
    } catch (e) {
      print(e);
      BotToast.showText(text: e.toString());
    }
  }
  static Future<dynamic> sendMultipartRequest({
    required String url,
    required requestType type,
    Map<String, String>? headers = const {},
    Map<String, dynamic>? params,
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},

  }) async {
    try {
      var request =
      http.MultipartRequest("POST", Uri.https(baseUrl, url, params));

      var _filesKeyList = files!.keys.toList();

      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        print(e);
      }

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

  static MediaType getContentType(String name) {
    var ext = name.split('.').last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }

}
