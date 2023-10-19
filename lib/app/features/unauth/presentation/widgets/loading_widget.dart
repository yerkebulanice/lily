import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading',
              style: theme.headline1.copyWith(fontSize: 36.h),
            ),
            Image.asset(
              ImageAsset.loading,
              height: 96.h,
              width: 96.h,
            ),
          ],
        ),
      ),
    );
  }
}
