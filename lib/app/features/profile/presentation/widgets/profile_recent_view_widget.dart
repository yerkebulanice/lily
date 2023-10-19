import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';

class ProfileRecentViewWidget extends StatelessWidget {
  const ProfileRecentViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return SizedBox(
      height: 72.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              color: theme.backgroundColor1,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 4.h,
              horizontal: 12.w,
            ),
            child: Row(
              children: [
                Image.asset(BouquetsAsset.image1),
                16.pw,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Juletta',
                      style: theme.headline2.copyWith(color: Colors.black),
                    ),
                    Text(
                      '12 000 KZT',
                      style: theme.headline2,
                    )
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => 7.pw,
        itemCount: 4,
      ),
    );
  }
}
