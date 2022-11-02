import 'package:flutter/material.dart';
import 'package:rewards_portal/feature/leadboard/ui/widgets/circular_name_avatar.dart';

class WinnerCircleBanner extends StatelessWidget {
  final String name;
  final int points;
  final int flex;

  const WinnerCircleBanner({
    Key? key,
    required this.name,
    required this.points,
    required this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularNameAvatar(
              name: name,
              maxRadius: 70,
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$points',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
