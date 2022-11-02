import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rewards_portal/feature/auth/domain/constants/auth_constants.dart';
import 'package:rewards_portal/feature/auth/domain/cubits/auth_cubit/auth_cubit.dart';
import 'package:rewards_portal/feature/auth/domain/cubits/web_view_cubit/web_view_cubit.dart';

class AuthWebviewPage extends StatelessWidget {
  const AuthWebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webViewCubit = WebViewCubit();

    return BlocBuilder<WebViewCubit, WebViewState>(
        bloc: webViewCubit,
        builder: (_, WebViewState state) {
          return Scaffold(
            body: Stack(
              children: [
                Opacity(
                  opacity: state.isLoading ? 0.3 : 1,
                  child: InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: Uri.parse(AuthConstants.authUrl)),
                    onWebViewCreated: (InAppWebViewController controller) {
                      controller.clearCache();
                      final cookieManager = CookieManager();
                      cookieManager.deleteAllCookies();
                    },
                    onConsoleMessage: (_, ConsoleMessage msg) => debugPrint(
                        'AuthWebview onConsoleMessage: ${msg.message}'),
                    onLoadStart: (_, Uri? uri) {
                      webViewCubit.startLoading();
                      debugPrint('AuthWebview onLoadStart: ${uri.toString()}');
                      context.read<AuthCubit>().checkForSuccess(uri, context);
                    },
                    onLoadStop: (_, Uri? uri) async {
                      debugPrint('AuthWebview onLoadStop: $uri');
                      bool isSuccess = await context
                          .read<AuthCubit>()
                          .checkForSuccess(uri, context);
                      if (!isSuccess) webViewCubit.stopLoading();
                    },
                  ),
                ),
                if (state.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        });
  }
}
