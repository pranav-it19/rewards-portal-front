import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeedShimmer extends StatelessWidget {
  const FeedShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(maxRadius: 25),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 100,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 8.0,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 200.0,
            color: Colors.white,
          ),
          // const SizedBox(height: 16),
        ],
      ),
    );
  }
}
