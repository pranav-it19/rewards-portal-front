abstract class LikeService {
  Future<Map<String, dynamic>> toggleLike(String postId);
}

class LikeServiceImpl implements LikeService {
  @override
  Future<Map<String, dynamic>> toggleLike(String postId) async {
    await Future.delayed(const Duration(seconds: 5));
    final response = {
      'key': 'value',
    };

    return response;
  }
}
