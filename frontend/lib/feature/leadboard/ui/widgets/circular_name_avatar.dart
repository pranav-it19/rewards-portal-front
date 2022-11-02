import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rewards_portal/core/constants/color_constants.dart';

class CircularNameAvatar extends StatelessWidget {
  final String name;
  final double maxRadius;

  const CircularNameAvatar({
    Key? key,
    required this.name,
    this.maxRadius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initials = name.split(' ').map((e) => e.substring(0, 1)).join();
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorConstants.blueBg,
        ),
        color: ColorConstants.blueBg,
      ),
      child: CircleAvatar(
          maxRadius: maxRadius,
          backgroundColor: ColorConstants.blueHighlight,
          child: Text(
            initials.substring(0, min(2, initials.length)),
            style: TextStyle(
              color: Colors.white,
              fontSize: maxRadius > 40 ? 50 : 36,
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
