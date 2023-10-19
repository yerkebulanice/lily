// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lily/app/core/service-locator/service_locator.dart';
import 'package:lily/app/features/favorite/presentation/pages/favorite_page.dart';
import 'package:lily/app/features/home/presentation/pages/home_page.dart';
import 'package:lily/app/features/profile/presentation/pages/profile_edit_page.dart';
import 'package:lily/app/features/profile/presentation/pages/profile_page.dart';
import 'package:lily/app/features/shop/presentation/pages/shop_page.dart';
import 'package:lily/app/navigation/home_navigation.dart';

class AuthNavigation implements ServiceLocator {
  static const String main = '/';
  static const String editProfile = '/editProfile';
  static const Duration navigationDuration = Duration(milliseconds: 250);

  final RouteObserver<ModalRoute> routeObserver;

  final GoRouter globalRouter;
  final GoRouter homeRoutes;
  final GoRouter shopRoutes;
  final GoRouter favoriteRoutes;
  final GoRouter profileRoutes;

  AuthNavigation({required this.routeObserver})
      : globalRouter = _globalRouter(routeObserver),
        homeRoutes = _homeRoutes,
        shopRoutes = _shopRoutes,
        favoriteRoutes = _favoriteRoutes,
        profileRoutes = _profileRoutes;

  static GoRouter _globalRouter(RouteObserver<ModalRoute> routeObserver) {
    return GoRouter(
      observers: [routeObserver],
      routes: <GoRoute>[
        GoRoute(
          name: main,
          path: main,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeNavigationPage();
          },
        ),
        GoRoute(
          path: editProfile,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProfileEditPage(),
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
            );
          },
        ),
      ],
    );
  }

  static GoRouter get _homeRoutes {
    return GoRouter(routes: [
      GoRoute(
        path: main,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ]);
  }

  static GoRouter get _shopRoutes {
    return GoRouter(routes: [
      GoRoute(
        path: main,
        builder: (BuildContext context, GoRouterState state) {
          return const ShopPage();
        },
      ),
    ]);
  }

  static GoRouter get _favoriteRoutes {
    return GoRouter(
      routes: [
        GoRoute(
          path: main,
          builder: (BuildContext context, GoRouterState state) {
            return const FavoritePage();
          },
        ),
      ],
    );
  }

  static GoRouter get _profileRoutes {
    return GoRouter(
      routes: [
        GoRoute(
          path: main,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
        GoRoute(
          path: editProfile,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProfileEditPage(),
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
            );
          },
        ),
      ],
    );
  }

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<AuthNavigation>(() => this);
  }
}
