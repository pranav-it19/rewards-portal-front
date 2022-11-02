import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/leadboard/domain/cubits/leaderboard_cubit.dart';
import 'package:rewards_portal/feature/leadboard/domain/models/leaderboard_user_model.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/winner_circle_banner.dart';

class WinnersSpotlight extends StatelessWidget {
  const WinnersSpotlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
          builder: (_, LeaderboardState state) {
        if (state is LeaderboardLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildTop3Banners(state.leaderboard),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  _buildTop3Banners(List<LeaderboardUserModel> users) {
    final top3 = _top3List(users);
    final banners = <Widget>[];

    banners.add(_bannerBuilder(top3[1]));
    banners.add(_bannerBuilder(top3[0], true));
    banners.add(_bannerBuilder(top3[2]));

    return banners;
  }

  WinnerCircleBanner _bannerBuilder(e, [bigger = false]) => WinnerCircleBanner(
        name: e.name,
        points: e.points,
        flex: bigger ? 3 : 2,
      );

  List<LeaderboardUserModel> _top3List(List<LeaderboardUserModel> users) {
    return users.sublist(0, min(3, users.length));
  }
}
