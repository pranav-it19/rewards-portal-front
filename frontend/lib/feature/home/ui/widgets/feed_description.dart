import 'package:flutter/material.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';

class FeedDescription extends StatelessWidget {
  const FeedDescription({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      child: Text(feedModel.message, style: TextStyle(),),
    );
  }
}
