import 'package:rewards_portal/feature/home/domain/models/feed_model.dart';
import 'package:rewards_portal/feature/home/domain/models/tag_model.dart';
import 'package:rewards_portal/feature/home/domain/services/feed_service.dart';

abstract class FeedRepository {
  Future<bool> addFeed(
      String tagId, String message, String mentionedEmail, String imageUrl);
  Future<List<FeedModel>> getFeeds();
  Future<List<TagModel>> getTags();
  Future<bool> updateFeed(String postId);
  Future<bool> deleteFeed(String postId);
  Future<bool> toggleLike(String postId);
}

class FeedRepositoryImpl implements FeedRepository {
  FeedRepositoryImpl(this.feedService);

  final FeedService feedService;
  final List<TagModel> tagsList = [];

  @override
  Future<bool> addFeed(String tagId, String message, String mentionedEmail,
      String imageurl) async {
    final response =
        await feedService.addFeed(tagId, message, mentionedEmail, imageurl);

    return response['status'] == 'OK';
  }

  @override
  Future<List<FeedModel>> getFeeds() async {
    List<Map<String, dynamic>> response = await feedService.getFeeds();

    List<FeedModel> feedsList = [];
    for (var feedJson in response) {
      feedsList.add(FeedModel.fromJson(feedJson));
    }

    return feedsList;
  }

  @override
  Future<List<TagModel>> getTags() async {
    List<Map<String, dynamic>> response = await feedService.getTags();

    for (var tagJson in response) {
      tagsList.add(TagModel.fromJson(tagJson));
    }

    return tagsList;
  }

  @override
  Future<bool> deleteFeed(String postId) {
    return Future.value(true);
  }

  @override
  Future<bool> updateFeed(String postId) {
    return Future.value(true);
  }

  @override
  Future<bool> toggleLike(String postId) async {
    final response = await feedService.toggleLike(postId);

    return response['status'] == 'OK';
  }
}
