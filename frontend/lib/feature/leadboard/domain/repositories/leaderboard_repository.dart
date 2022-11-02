import 'package:rewards_portal/feature/leadboard/domain/models/leaderboard_user_model.dart';
import 'package:rewards_portal/feature/leadboard/domain/services/leaderboard_service.dart';

abstract class LeaderboardRepo {
  Future<List<LeaderboardUserModel>> getLeaderboard();
}

class LeaderboardRepoImpl implements LeaderboardRepo {
  LeaderboardRepoImpl(this.leaderboardService);

  final LeaderboardService leaderboardService;

  @override
  Future<List<LeaderboardUserModel>> getLeaderboard() async {
    final jsonResponse = await leaderboardService.getLeaderboard();

    return jsonResponse.map((user) => LeaderboardUserModel.fromMap(user)).toList();
  }
}
