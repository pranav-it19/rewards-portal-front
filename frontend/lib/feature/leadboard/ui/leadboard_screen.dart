import 'package:flutter/material.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';
import 'package:rewards_portal/feature/auth/ui/widgets/logout_button.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/leaderboard_section.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/user_section.dart';

class LeadboardScreen extends StatelessWidget {
  const LeadboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.blueBg,
      title: const Text(
        'LEADERBOARD',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      actions: const [LogoutButton()],
    );

    return Scaffold(
      appBar: appBar,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [
          LeaderboardSection(),
          UserSection(),
        ],
      ),
    );
  }
}
