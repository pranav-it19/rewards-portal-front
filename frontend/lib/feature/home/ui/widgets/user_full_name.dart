import 'package:flutter/material.dart';

class UserFullName extends StatelessWidget {
  const UserFullName({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Text(
      fullName,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }
}
