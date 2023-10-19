import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';

class ShopCardItem extends StatelessWidget {
  final int i;
  const ShopCardItem({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return SizedBox(
      height: 188.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 152.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(ImageAsset.productBackground),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Center(child: Image.asset('assets/images/bouquets/image${i + 1}.png')),
          ),
          20.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Juletta', style: theme.headline1),
                14.ph,
                Expanded(
                  child: Text(
                    'Cloud hydrangea with eucalyptus',
                    style: theme.headline2.copyWith(fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                24.ph,
                Text('12 000 KZT', style: theme.headline1),
                const Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: theme.backgroundColor1,
                  ),
                  height: 40.h,
                  width: 120.w,
                  padding: EdgeInsets.all(8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton.h1(
                        height: 24.h,
                        width: 24.h,
                        title: '',
                        onPressed: () {},
                        child: const Icon(Icons.remove_outlined, color: Colors.white),
                      ),
                      Text('0', style: theme.headline1),
                      CustomButton.h1(
                        height: 24.h,
                        width: 24.h,
                        title: '',
                        onPressed: () {},
                        child: const Icon(Icons.add_outlined, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
