import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return CustomButton.h1(
      title: '',
      height: 42.h,
      width: 42.h,
      borderRadius: 36,
      onPressed: () {},
      color: Colors.white,
      child: Icon(
        Icons.favorite_border_outlined,
        color: theme.backgroundColor3,
      ),
    );
  }
}
