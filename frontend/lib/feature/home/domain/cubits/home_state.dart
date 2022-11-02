import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';
import 'package:rewards_portal/feature/home/domain/models/tag_model.dart';

class HomeState {
  final List<FeedModel> feedsList;
  final List<TagModel> tagsList;
  final bool isLoading;

  HomeState({
    this.feedsList = const [],
    this.tagsList = const [],
    this.isLoading = false,
  });

  HomeState copyWith({
    final List<FeedModel>? feedsList,
    final List<TagModel>? tagsList,
    final bool? isLoading,
  }) {
    return HomeState(
      feedsList: feedsList ?? this.feedsList,
      tagsList: tagsList ?? this.tagsList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
