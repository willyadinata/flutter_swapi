import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<String, dynamic>? queryParameters}) async {
    final Response response = await _client.get(
      Uri.http(ApiConst.baseUrl, path, queryParameters),
      headers: {
        'Content-Type': 'application/json',
        'charset': 'utf-8',
      },
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Status Code: ' + response.statusCode.toString());
        print('URL Request: ' + response.request.toString());
      }
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
