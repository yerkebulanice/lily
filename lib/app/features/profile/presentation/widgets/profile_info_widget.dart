import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/core/ui/custom_image_widget.dart';
import 'package:lily/app/navigation/auth_navigation.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  String get getImgUrl {
    var rng = Random();
    String url = 'https://xsgames.co/randomusers/avatar.php?g=';
    if (rng.nextInt(1) == 0) {
      return '${url}male';
    } else {
      return '${url}female';
    }
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return SizedBox(
      // height: 107.h,
      child: Row(
        children: [
          CustomImageWidget(
            url: getImgUrl,
            height: 107.h,
            width: 135.w,
            borderRadius: 8.sp,
          ),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jennie Kim',
                style: theme.headline1.copyWith(color: Colors.black),
              ),
              12.ph,
              Text(
                'agaziz157@gmail.com\n+7 708 697 34 48',
                style: theme.headline2.copyWith(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              // const Expanded(child: SizedBox.shrink()),
              GestureDetector(
                onTap: () {
                  globalSL<AuthNavigation>().globalRouter.push(AuthNavigation.editProfile);
                },
                child: Text(
                  'Edit profile',
                  style: theme.headline4.copyWith(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
