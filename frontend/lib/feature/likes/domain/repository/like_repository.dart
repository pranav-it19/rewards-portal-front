import 'package:rewards_portal/feature/likes/domain/services/like_service.dart';

abstract class LikeRepository {
  Future<bool> toggleLike(String postId);
}

class LikeRepositoryImpl implements LikeRepository {
  LikeRepositoryImpl(this.likeService);

  final LikeService likeService;

  @override
  Future<bool> toggleLike(String postId) async {
    return Future.value(true);
  }
}
