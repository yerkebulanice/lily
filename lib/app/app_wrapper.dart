import 'package:flutter/material.dart';
import 'package:lily/app/app_sl.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/features/unauth/unauth_sl.dart';
import 'package:lily/app/navigation/auth_navigation.dart';
import 'package:lily/app/navigation/navigation.dart';
import 'package:lily/app/navigation/unauth_navigation.dart';

class AppWrapper extends StatelessWidget {
  final AppSl appSl;
  const AppWrapper({super.key, required this.appSl});

  @override
  Widget build(BuildContext context) => const MainNavigation();

  Future<void> init() async {
    await ServiceLocatorManager.init(
      services: [
        AuthNavigation(routeObserver: RouteObserver<ModalRoute>()),
        UnauthNavigation(),
        UnauthServiceLocator(),
        appSl,
      ],
    );
  }
}
