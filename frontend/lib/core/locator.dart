import 'package:get_it/get_it.dart';
import 'package:rewards_portal/core/repository/user_repository.dart';
import 'package:rewards_portal/core/services/http_service.dart';
import 'package:rewards_portal/core/services/user_service.dart';
import 'package:rewards_portal/feature/auth/domain/services/auth_service.dart';
import 'package:rewards_portal/feature/comments/domain/repository/comment_repository.dart';
import 'package:rewards_portal/feature/comments/domain/services/comment_service.dart';
import 'package:rewards_portal/feature/home/domain/repository/feed_repository.dart';
import 'package:rewards_portal/feature/home/domain/services/feed_service.dart';
import 'package:rewards_portal/feature/leadboard/domain/repositories/leaderboard_repository.dart';
import 'package:rewards_portal/feature/leadboard/domain/services/leaderboard_service.dart';
import 'package:rewards_portal/feature/likes/domain/repository/like_repository.dart';
import 'package:rewards_portal/feature/likes/domain/services/like_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Auth
  getIt.registerSingleton<AuthService>(AuthService());

  // Users
  getIt.registerSingleton<UserService>(UserServiceImpl());
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt<UserService>()),
  );

  // Feeds
  getIt.registerSingleton<FeedService>(FeedServicImpl());
  getIt.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(getIt<FeedService>()),
  );

  // Comments
  getIt.registerSingleton<CommentService>(CommentServiceImpl());
  getIt.registerLazySingleton<CommentRepository>(
    () => CommentRepositoryImpl(getIt<CommentService>()),
  );

  // Likes
  getIt.registerSingleton<LikeService>(LikeServiceImpl());
  getIt.registerLazySingleton<LikeRepository>(
    () => LikeRepositoryImpl(getIt<LikeService>()),
  );

  // Leaderboard
  getIt.registerSingleton<LeaderboardService>(LeaderboardServiceImpl());
  getIt.registerLazySingleton<LeaderboardRepo>(
    () => LeaderboardRepoImpl(getIt<LeaderboardService>()),
  );

  // Network
  getIt.registerSingleton<HttpService>(HttpService());
}
