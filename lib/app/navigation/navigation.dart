// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/config/ui/ui_config.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/features/unauth/presentation/bloc/auth/auth_bloc.dart';
import 'package:lily/app/features/unauth/presentation/widgets/loading_widget.dart';
import 'package:lily/app/navigation/auth_navigation.dart';
import 'package:lily/app/navigation/unauth_navigation.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigation();
}

class _MainNavigation extends State<MainNavigation> {
  @override
  void initState() {
    globalSL<AuthBloc>().add(AppStartedAuthEvent());
    super.initState();
  }

  @override
  void dispose() {
    globalSL<AuthBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(UiConfig.globalWidth, UiConfig.globalHeight),
      builder: (_, __) => BlocConsumer<AuthBloc, AuthState>(
        bloc: globalSL<AuthBloc>(),
        listener: (_, AuthState state) {
          if (state is AuthenticatedAuthState) {}
        },
        builder: (BuildContext context, AuthState state) {
          GoRouter router = getLoading;
          if (state is UnauthenticatedAuthState) {
            router = globalSL<UnauthNavigation>().goRouter;
          } else if (state is AuthenticatedAuthState) {
            router = globalSL<AuthNavigation>().globalRouter;
          }
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
              debugShowCheckedModeBanner: false,
              theme: CustomThemeExtension.lightThemeData,
              darkTheme: CustomThemeExtension.darkThemeData,
              themeMode: ThemeMode.light,
              // localizationsDelegates: context.localizationDelegates,
              // locale: context.locale,
              // supportedLocales: context.supportedLocales,
            ),
          );
        },
      ),
    );
  }

  GoRouter get getLoading {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const LoadingWidget();
          },
        )
      ],
    );
  }
}
