import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_state.dart';
import 'package:rewards_portal/feature/home/ui/widgets/custom_shimmer.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_shimmer.dart';
import 'package:rewards_portal/feature/leadboard/domain/cubits/leaderboard_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<LeaderboardCubit>().getLeaderboard();
    context.read<HomeCubit>().getFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state.isLoading) {
            return _showShimmer();
          }
          return _showFeeds(state);
        },
      ),
    );
  }

  Widget _showFeeds(HomeState state) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: state.feedsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Feed(feedModel: state.feedsList[index]);
        },
      ),
    );
  }

  Widget _showShimmer() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const CustomShimmer(child: FeedShimmer());
        },
      ),
    );
  }
}
