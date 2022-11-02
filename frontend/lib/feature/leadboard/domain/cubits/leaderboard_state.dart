part of 'leaderboard_cubit.dart';

abstract class LeaderboardState {}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final List<LeaderboardUserModel> leaderboard;

  LeaderboardLoaded({required this.leaderboard});
}