import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';

class FeedImage extends StatelessWidget {
  const FeedImage({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: feedModel.imageUrl!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
