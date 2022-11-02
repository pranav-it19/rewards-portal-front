import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final storage = const FlutterSecureStorage();

  Future<bool> loginWithAccessToken(String accessToken) async {
    await storage.write(
        key: StorageConstants.accessTokenKey, value: accessToken);

    return true;
  }

  Future<bool> isLoggedIn() async {
    final accessToken =
        await storage.read(key: StorageConstants.accessTokenKey);

    if (accessToken != null) {
      return !JwtDecoder.isExpired(accessToken);
    }

    return false;
  }

  Future<void> logOut() async {
    await storage.delete(key: StorageConstants.accessTokenKey);
  }

  Future<String?> getAccessToken() async {
    return storage.read(key: StorageConstants.accessTokenKey);
  }
}

abstract class StorageConstants {
  static const String accessTokenKey = 'accessToken';
}
