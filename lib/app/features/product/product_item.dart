import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/data/entity/flower.dart';
import 'package:lily/app/features/global/add_button.dart';
import 'package:lily/app/features/global/like_button.dart';

class ProductItem extends StatelessWidget {
  final Flower flower;
  const ProductItem({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return SizedBox(
      height: 272.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 254.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(ImageAsset.productBackground),
                  fit: BoxFit.fitHeight,
                ),
              ),
              padding: EdgeInsets.only(
                // top: 10.h,
                right: 20.w,
                left: 20.w,
                bottom: 20.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 150.h,
                    child: Image.asset(flower.image),
                  ),
                  // 12.ph,
                  Text(
                    flower.name,
                    style: theme.headline4,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  8.ph,
                  Text('${flower.price} KZT', style: theme.headline2),
                  // 15.ph,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AddButton(),
                7.pw,
                const LikeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
