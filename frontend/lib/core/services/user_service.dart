import 'dart:convert';

import 'package:http/http.dart';
import 'package:rewards_portal/core/constants/api_constants.dart';
import 'package:rewards_portal/feature/config/config.dart';

import '../locator.dart';
import 'http_service.dart';

abstract class UserService {
  Future<List<Map<String, dynamic>>> getUsers();
}

class UserServiceImpl implements UserService {
  static String baseUrl = ApiConstants.baseUrl;
  static const String getUsersApi = 'users';

  String _getFullUrl(String api) {
    return '$baseUrl$api';
  }

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    Response response = await getIt<HttpService>()
        .getRequest(Uri.parse(_getFullUrl(getUsersApi)));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> res = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      return res;
    }

    return [];
  }
}
