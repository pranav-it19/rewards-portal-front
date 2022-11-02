import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/auth/ui/widgets/loading_page.dart';
import 'package:rewards_portal/feature/comments/domain/cubits/comment_cubit.dart';
import 'package:rewards_portal/feature/dashboard/ui/dashboard_screen.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/auth/domain/cubits/auth_cubit/auth_cubit.dart';
import 'package:rewards_portal/feature/auth/ui/auth_webview_page.dart';
import 'package:rewards_portal/feature/leadboard/domain/cubits/leaderboard_cubit.dart';
import 'package:rewards_portal/feature/users/cubits/user_cubit.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit()..init(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<CommentCubit>(
          create: (_) => CommentCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => UserCubit(),
        ),
        BlocProvider<LeaderboardCubit>(
          create: (_) => LeaderboardCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Rewards Portal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, AuthState state) {
            if (state is NotLoggedIn) {
              return const AuthWebviewPage();
            } else if (state is LoggedIn) {
              return const DashboardScreen();
            }
            return const LoadingPage();
          },
        ),
      ),
    );
  }
}
