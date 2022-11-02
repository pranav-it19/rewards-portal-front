import 'package:flutter/material.dart';
import 'package:lit_relative_date_time/lit_relative_date_time.dart';

class PostedTime extends StatelessWidget {
  const PostedTime({
    Key? key,
    required this.postedTime,
  }) : super(key: key);

  final String postedTime;

  @override
  Widget build(BuildContext context) {
    return RelativeDateTimeBuilder(
      date: DateTime.now(),
      builder: (_, String formatted) {
        return Text(
          formatted,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.60),
          ),
        );
      },
      other: DateTime.parse(postedTime),
    );
  }
}
