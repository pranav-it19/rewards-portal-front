import 'package:flutter/material.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({
    Key? key,
    required this.initial,
  }) : super(key: key);

  final String initial;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 25,
      child: Text(initial),
    );
  }
}
