import 'dart:convert';

import 'package:http/http.dart';
import 'package:rewards_portal/core/constants/api_constants.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/core/services/http_service.dart';
import 'package:rewards_portal/feature/config/config.dart';

abstract class FeedService {
  Future<Map<String, dynamic>> addFeed(
      String tagId, String message, String mentionedEmail, String imageUrl);
  Future<List<Map<String, dynamic>>> getFeeds();
  Future<List<Map<String, dynamic>>> getTags();
  Future<Map<String, dynamic>> updateFeed(String postId);
  Future<Map<String, dynamic>> deleteFeed(String postId);
  Future<Map<String, dynamic>> toggleLike(String postId);
}

class FeedServicImpl implements FeedService {
  static String baseUrl = ApiConstants.baseUrl;
  static const String addPostsApi = 'posts';
  static const String getPostsApi = 'posts';
  static const String getTagsApi = 'tags';
  static const String likeApi = 'posts/{postId}/like';

  String _getFullUrl(String api) {
    return '$baseUrl$api';
  }

  @override
  Future<Map<String, dynamic>> addFeed(String tagId, String message,
      String mentionedEmail, String imageUrl) async {
    Response response = await getIt<HttpService>().postRequest(
      Uri.parse(_getFullUrl(getPostsApi)),
      {"tagId": tagId, "message": message, "imageURL": imageUrl},
    );

    if ([200, 201].contains(response.statusCode)) {
      return (jsonDecode(response.body) as Map<String, dynamic>);
    }

    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> getFeeds() async {
    Response response = await getIt<HttpService>()
        .getRequest(Uri.parse(_getFullUrl(addPostsApi)));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> res = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      return res;
    }

    return [];
  }

  @override
  Future<List<Map<String, dynamic>>> getTags() async {
    Response response = await getIt<HttpService>()
        .getRequest(Uri.parse(_getFullUrl(getTagsApi)));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> res = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      return res;
    }

    return [];
  }

  @override
  Future<Map<String, dynamic>> deleteFeed(String postId) async {
    await Future.delayed(const Duration(seconds: 5));
    final response = {
      'key': 'value',
    };

    return response;
  }

  @override
  Future<Map<String, dynamic>> updateFeed(String postId) async {
    await Future.delayed(const Duration(seconds: 5));
    final response = {
      'key': 'value',
    };

    return response;
  }

  @override
  Future<Map<String, dynamic>> toggleLike(String postId) async {
    Response response = await getIt<HttpService>().postRequest(
        Uri.parse(_getFullUrl(likeApi.replaceAll('{postId}', postId))), {});

    if ([200, 201].contains(response.statusCode)) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    return {};
  }
}
