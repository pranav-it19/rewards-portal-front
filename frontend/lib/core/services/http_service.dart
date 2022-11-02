import 'dart:convert';

import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/auth/domain/services/auth_service.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> getRequest(Uri url) async {
    return http.get(url, headers: await _getTokenHeader());
  }

  Future<http.Response> postRequest(Uri url, Map<String, String> body) async {
    return http.post(url,
        body: jsonEncode(body), headers: await _getTokenHeader());
  }

  Future<http.Response> putRequest(Uri url, Map<String, String> body) async {
    return http.put(url, body: body, headers: await _getTokenHeader());
  }

  Future<http.Response> deleteRequest(Uri url) async {
    return http.delete(url, headers: await _getTokenHeader());
  }

  Future<Map<String, String>> _getTokenHeader() async {
    final token = await getIt<AuthService>().getAccessToken();
    return <String, String>{
      'Authorization': token ?? '',
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }
}
