part of 'web_view_cubit.dart';

class WebViewState {
  final bool isLoading;

  WebViewState({this.isLoading = true});

  WebViewState copyWith({bool? isLoading}) {
    return WebViewState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}