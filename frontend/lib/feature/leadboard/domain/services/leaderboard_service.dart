import 'dart:convert';

import 'package:rewards_portal/core/constants/api_constants.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/core/services/http_service.dart';

typedef GetLeaderboardResponse = List<dynamic>;

abstract class LeaderboardService {
  Future<GetLeaderboardResponse> getLeaderboard();
}

class LeaderboardServiceImpl implements LeaderboardService {
  static const String getLeaderboardUrl = '${ApiConstants.baseUrl}leaderboard';
  @override
  Future<GetLeaderboardResponse> getLeaderboard() async {
    final response =
        await getIt<HttpService>().getRequest(Uri.parse(getLeaderboardUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception();
  }
}
