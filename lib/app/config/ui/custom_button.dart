import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button_wrapper.dart';
import 'package:lily/app/config/ui/custom_loading.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isDisabled;
  final bool isWidthOff; // width will be determined based on content
  final bool isTextButton;
  final Color? textColor;
  final void Function() onPressed;

  // Size with no ScreenUtil
  final double width;
  final double height;
  final double progresHeight;
  final double borderRadius;
  final double fontSize;

  // optional
  final Widget? child;
  final Color? color;
  final BorderRadius? fullBorderRadius;

  const CustomButton({
    super.key,
    required this.title,
    required this.isLoading,
    required this.isDisabled,
    required this.onPressed,
    required this.width,
    required this.height,
    this.textColor,
    this.color,
    this.isTextButton = false,
    this.isWidthOff = false,
    this.progresHeight = 24,
    this.fontSize = 17,
    this.borderRadius = 16,
    this.fullBorderRadius,
    this.child,
  });

  factory CustomButton.textBtn(
      {required String title,
      required void Function() onPressed,
      bool isLoading = false,
      bool isDisabled = false,
      double width = 327,
      double height = 52,
      double fontSize = 17,
      Color? color,
      Widget? child}) {
    return CustomButton(
      title: title,
      isLoading: isLoading,
      isDisabled: isDisabled,
      onPressed: onPressed,
      width: width,
      color: color,
      height: height,
      fontSize: fontSize,
      isTextButton: true,
      child: child,
    );
  }

  factory CustomButton.h1({
    required String title,
    required void Function() onPressed,
    double width = 327,
    double height = 56,
    bool isLoading = false,
    bool isDisabled = false,
    bool isWidthOff = false,
    Color? color,
    Widget? child,
    double? borderRadius,
    BorderRadius? fullBorderRadius,
    Color? textColor,
    double? fontSize,
  }) {
    return CustomButton(
      title: title,
      isLoading: isLoading,
      isDisabled: isDisabled,
      isWidthOff: isWidthOff,
      onPressed: onPressed,
      borderRadius: borderRadius ?? 12,
      width: width,
      height: height,
      color: color,
      textColor: textColor,
      fullBorderRadius: fullBorderRadius,
      fontSize: fontSize ?? 14,
      child: child,
    );
  }

  factory CustomButton.h2(
      {required String title,
      required void Function() onPressed,
      double width = 327,
      double height = 48,
      double fontSize = 16,
      bool isLoading = false,
      bool isDisabled = false,
      bool isWidthOff = false,
      Color? color,
      Widget? child}) {
    return CustomButton(
      title: title,
      isLoading: isLoading,
      isDisabled: isDisabled,
      isWidthOff: isWidthOff,
      onPressed: onPressed,
      width: width,
      height: height,
      borderRadius: 12,
      fontSize: fontSize,
      color: color,
      child: child,
    );
  }

  factory CustomButton.h3({
    required String title,
    required void Function() onPressed,
    double width = 327,
    double height = 24,
    double fontSize = 12,
    bool isLoading = false,
    bool isDisabled = false,
    bool isWidthOff = false,
    Color? color,
    Widget? child,
  }) {
    return CustomButton(
      title: title,
      isLoading: isLoading,
      isDisabled: isDisabled,
      isWidthOff: isWidthOff,
      onPressed: onPressed,
      width: width,
      height: height,
      progresHeight: 12,
      borderRadius: 6,
      fontSize: fontSize,
      color: color,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);

    final Widget elevatedBtn = ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.black12),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return color ?? theme.backgroundColor4;
            }
            return color ?? theme.secondaryColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: fullBorderRadius ?? BorderRadius.circular(borderRadius.h),
            ),
          ),
        ),
        child:
            _buildChild(context: context, primaryColor: textColor ?? Colors.white, theme: theme));

    final Widget textBtn = CustomButtonWrapper(
      onPressed: isDisabled ? null : onPressed,
      color: color,
      borderRadius: 10.sp,
      child: isLoading
          ? CustomLoading(
              progresHeight: progresHeight,
              strokeWidth: 1,
            )
          : Text(
              title,
              textAlign: TextAlign.center,
              style: theme.headline2.copyWith(
                fontSize: fontSize.h,
                color: !isDisabled ? theme.backgroundColor1 : color,
              ),
            ),
    );

    return SizedBox(
      width: isWidthOff ? null : width.w,
      height: height.h,
      child: isTextButton ? textBtn : elevatedBtn,
    );
  }

  Widget _buildChild(
      {required BuildContext context,
      required Color primaryColor,
      required CustomThemeExtension theme}) {
    final TextStyle style = fontSize < 14 ? theme.headline4 : theme.headline4;
    return isLoading
        ? CustomLoading(
            progresHeight: progresHeight,
            strokeWidth: 2,
            padding: 0,
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: isWidthOff ? 10.w : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (child == null) const SizedBox() else child!,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                    fontSize: fontSize.h,
                    color: isDisabled ? theme.backgroundColor2 : primaryColor,
                  ),
                ),
              ],
            ),
          );
  }
}
