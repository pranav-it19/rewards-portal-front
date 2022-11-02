import 'dart:convert';

import 'package:http/http.dart';
import 'package:rewards_portal/core/constants/api_constants.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/core/services/http_service.dart';
import 'package:rewards_portal/feature/config/config.dart';

abstract class CommentService {
  Future<List<Map<String, dynamic>>> getComments(String postId);
  Future<Map<String, dynamic>> addComment(String postId, String comment);
  Future<Map<String, dynamic>> deleteComment({
    required String postId,
    required String commentId,
  });
}

class CommentServiceImpl implements CommentService {
  static const String baseUrl = ApiConstants.baseUrl;
  static const String getPostApi = 'posts/{postId}';
  static const String createCommentApi = 'post/{postId}/comment';
  static const String deleteCommentApi = 'post/{postId}/comment/{commentId}';

  String _getFullUrl(String api) {
    print('$baseUrl$api');
    return '$baseUrl$api';
  }

  @override
  Future<List<Map<String, dynamic>>> getComments(String postId) async {
    Response response = await getIt<HttpService>().getRequest(
        Uri.parse(_getFullUrl(getPostApi.replaceAll('{postId}', postId))));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> res =
          (jsonDecode(response.body)['comments'] as List)
              .map((e) => e as Map<String, dynamic>)
              .toList();

      return res;
    }

    return [];
  }

  @override
  Future<Map<String, dynamic>> addComment(String postId, String comment) async {
    Response response = await getIt<HttpService>().postRequest(
        Uri.parse(_getFullUrl(createCommentApi.replaceAll('{postId}', postId))),
        {"message": comment});
    var responseVal;
    if (response.statusCode == 200) {
      responseVal = json.decode(response.body);
    } else {
      responseVal = {
        'status': 'error',
      };
    }

    return responseVal;
  }

  @override
  Future<Map<String, dynamic>> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    Response response = await getIt<HttpService>().deleteRequest(
      Uri.parse("${baseUrl}post/$postId/comment/$commentId"),
    );
    var responseVal;
    if (response.statusCode == 200) {
      responseVal = json.decode(response.body);
    } else {
      responseVal = {
        'status': 'error',
      };
    }

    return responseVal;
  }
}
