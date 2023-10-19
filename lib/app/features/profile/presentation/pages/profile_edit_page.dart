import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/ui/custom_image_widget.dart';
import 'package:lily/app/core/ui/custom_textfield.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 15.h,
            top: 25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: theme.backgroundColor3,
                  ),
                ),
              ),
              Text(
                'My Profile',
                style: theme.headline1.copyWith(fontSize: 32.h),
              ),
              30.ph,
              Center(
                child: CustomImageWidget(
                  url: getImgUrl,
                  borderRadius: 8.sp,
                  width: 135.w,
                  height: 107.h,
                ),
              ),
              26.ph,
              Container(
                height: 2.h,
                width: double.infinity,
                color: Colors.grey,
              ),
              40.ph,
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Name',
              ),
              22.ph,
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Gmail',
              ),
              22.ph,
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Phone Number',
              ),
              40.ph,
              CustomButton.h1(
                title: 'Done',
                width: double.infinity,
                height: 44.h,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
