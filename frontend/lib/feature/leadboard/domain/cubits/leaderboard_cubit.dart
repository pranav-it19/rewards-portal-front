import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/leadboard/domain/models/leaderboard_user_model.dart';
import 'package:rewards_portal/feature/leadboard/domain/repositories/leaderboard_repository.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit() : super(LeaderboardLoading());

  Future<void> getLeaderboard() async {
    emit(LeaderboardLoading());
    final leaderboard = await getIt<LeaderboardRepo>().getLeaderboard();
    emit(LeaderboardLoaded(leaderboard: leaderboard));
  }
}