import 'package:flutter/material.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';

import 'circle_user_avatar.dart';
import 'posted_time.dart';
import 'user_full_name.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleUserAvatar(initial: feedModel.initial),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserFullName(fullName: feedModel.authorName),
            const SizedBox(height: 4),
            PostedTime(postedTime: feedModel.createdAt),
          ],
        ),
      ],
    );
  }
}
