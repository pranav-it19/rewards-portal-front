import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';
import 'package:rewards_portal/feature/leadboard/domain/cubits/leaderboard_cubit.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/circular_name_avatar.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, LeaderboardState state) {
      if (state is LeaderboardLoaded) {
        return _decoration(context, _body(state));
      }
      return Container();
    });
  }

  Container _decoration(BuildContext context, Widget child) {
    return Container(
      color: ColorConstants.blueBg,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Column _body(LeaderboardLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Header(),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: state.leaderboard.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final user = state.leaderboard[index + 3];
              return LeaderboardCard(
                name: user.name,
                rank: index + 1 + 3,
                points: user.points,
              );
            },
          ),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 14),
      child: Text(
        'Board',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class LeaderboardCard extends StatelessWidget {
  final String name;
  final int rank;
  final int points;

  const LeaderboardCard({
    Key? key,
    required this.name,
    required this.rank,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: CircularNameAvatar(
              name: name,
              maxRadius: 40,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rank  '),
              Text('$rank'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Score  '),
              Text('$points'),
            ],
          )
        ],
      ),
    );
  }
}
