import 'package:flutter_bloc/flutter_bloc.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(WebViewState());

  startLoading() => emit(state.copyWith(isLoading: true));

  stopLoading() => emit(state.copyWith(isLoading: false));
}
