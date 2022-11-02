import 'package:flutter/material.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/winners_spotlight.dart';

class LeaderboardSection extends StatelessWidget {
  const LeaderboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: ColorConstants.blueBg,
      child: Column(
        children: const [
          // SizedBox(height: 20),
          // DurationFilterHeader(),
          SizedBox(height: 20),
          WinnersSpotlight(),
        ],
      ),
    );
  }
}
