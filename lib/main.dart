import 'package:flutter/material.dart';
import 'package:lily/app/app_sl.dart';
import 'package:lily/app/app_wrapper.dart';

void main() async {
  final AppSl appSl = AppSl();
  AppWrapper appWrapper = AppWrapper(appSl: appSl);
  await appWrapper.init();
  runApp(appWrapper);
}
