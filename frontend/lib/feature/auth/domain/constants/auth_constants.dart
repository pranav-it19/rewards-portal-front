abstract class AuthConstants {
  static String authUrl =
      "https://rewards-portal.qlikverify.com/auth/realms/rewards-portal/protocol/openid-connect/auth?client_id=$clientId&redirect_uri=$redirectUrl&scope=openid&response_type=token&response_mode=fragment&nonce=a3329fb2-b25d-4e05-84cf-b54663478822";

  static String clientId = "keun7G37PMG9oqHCBhcr5dktjaujyfFj";
  static String redirectUrl = "https://debugger.qlikverify.com/debug";
}
