import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';
import 'package:rewards_portal/feature/home/ui/widgets/feed_action_icon.dart';

import '../../../comments/ui/comments_screen.dart';

class FeedActions extends StatelessWidget {
  const FeedActions({
    Key? key,
    required this.feedModel,
  }) : super(key: key);

  final FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FeedActionIcon(
          count: feedModel.likesCount,
          icon: feedModel.isLiked
              ? Icons.favorite_outlined
              : Icons.favorite_border_outlined,
              color: feedModel.isLiked ? Colors.red : null,
          onTap: () {
            // TODO: handle like/dislike action here
            debugPrint('Handle like/dislike action here');
            context.read<HomeCubit>().toggleLike(feedModel.id);
          },
        ),
        const SizedBox(width: 12),
        FeedActionIcon(
          count: feedModel.commentsCount,
          icon: Icons.messenger_outline,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              context: context,
              builder: (_) => CommentsScreen(postId: feedModel.id),
            );
          },
        ),
      ],
    );
  }
}
