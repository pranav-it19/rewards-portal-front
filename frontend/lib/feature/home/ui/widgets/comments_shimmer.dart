// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommentsShimmer extends StatelessWidget {
  const CommentsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(maxRadius: 25),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 10.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 250,
                height: 25.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
