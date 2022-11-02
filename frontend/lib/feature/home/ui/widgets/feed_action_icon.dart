import 'package:flutter/material.dart';

class FeedActionIcon extends StatelessWidget {
  const FeedActionIcon({
    Key? key,
    required this.count,
    required this.icon,
    required this.onTap,
    this.color,
  }) : super(key: key);

  final int count;
  final IconData icon;
  final Function() onTap;
  final Color? color;

  bool get showCount => count > 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              if (showCount) const SizedBox(width: 6),
              if (showCount)
                Text(
                  '$count',
                  style: const TextStyle(fontSize: 14),
                ),
            ],
          )
        ],
      ),
    );
  }
}
