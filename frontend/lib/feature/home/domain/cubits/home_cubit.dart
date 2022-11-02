import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_state.dart';
import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';
import 'package:rewards_portal/feature/home/domain/models/tag_model.dart';
import 'package:rewards_portal/feature/home/domain/repository/feed_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> getFeeds() async {
    _toggleLoading(true);
    List<FeedModel> feedsList = await getIt<FeedRepository>().getFeeds();
    emit(state.copyWith(feedsList: feedsList));
    _toggleLoading(false);
  }

  Future<void> getTags() async {
    List<TagModel> tagsList = await getIt<FeedRepository>().getTags();
    emit(state.copyWith(tagsList: tagsList));
  }

  void _toggleLoading(bool isLoading) =>
      emit(state.copyWith(isLoading: isLoading));

  void toggleLike(String postId) async {
    final feedList = state.feedsList;
    final affectedPost = state.feedsList.where((el) => el.id == postId).first;
    int index = 0;
    for(;index<feedList.length; index++) {
      if(feedList[index].id == affectedPost.id) break;
    }
    feedList.removeWhere((el) => el.id == affectedPost.id);

    final newPost = affectedPost.copyWith(
      isLiked: !affectedPost.isLiked,
      likesCount: affectedPost.isLiked
          ? affectedPost.likesCount - 1
          : affectedPost.likesCount + 1,
    );
    feedList.insert(index, newPost);

    emit(state.copyWith(feedsList: feedList));

    final success = await getIt<FeedRepository>().toggleLike(postId);
    if (!success) return;
  }
}
