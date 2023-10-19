import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lily/app/core/service-locator/service_locator.dart';
import 'package:lily/app/features/unauth/presentation/pages/signin_page.dart';
import 'package:lily/app/features/unauth/presentation/pages/signup_page.dart';

class UnauthNavigation extends ServiceLocator {
  // static const String onboarding = '/';
  static const String signup = '/';
  static const String signin = '/signin';

  final GoRouter goRouter;
  UnauthNavigation() : goRouter = _router;

  static GoRouter get _router => GoRouter(
        routes: <GoRoute>[
          GoRoute(
            path: signin,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SignInPage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
              );
            },
          ),
          GoRoute(
            path: signup,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SignUpPage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
              );
            },
          ),
        ],
      );

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<UnauthNavigation>(() => this);
  }
}
