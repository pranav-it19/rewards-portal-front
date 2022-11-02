import 'package:flutter/material.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_actions.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_description.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_header.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_image.dart';

class Feed extends StatelessWidget {
  const Feed({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedHeader(feedModel: feedModel),
            FeedDescription(feedModel: feedModel),
            if (feedModel.imageUrl != null) FeedImage(feedModel: feedModel),
            const SizedBox(height: 16),
            FeedActions(feedModel: feedModel),
          ],
        ),
      ),
    );
  }
}
