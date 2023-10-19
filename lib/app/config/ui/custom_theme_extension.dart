import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color primaryColor; // primary color of app and used to make accent
  final Color secondaryColor; // color to make secondary accent

  final Color backgroundColor1; // darkest background color
  final Color backgroundColor2;
  final Color backgroundColor3;
  final Color backgroundColor4; // lightest background color

  final Color textColor1; // most active text color
  final Color textColor2; // disabled color

  final Color? scaffoldBackgroundColor;
  CustomThemeExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.backgroundColor3,
    required this.backgroundColor4,
    required this.textColor1,
    required this.textColor2,
    this.scaffoldBackgroundColor,
  });

  factory CustomThemeExtension.of(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>() ?? CustomThemeExtension.dark();
  }

  factory CustomThemeExtension.light() => CustomThemeExtension(
        primaryColor: const Color(0xffFDDCDC),
        secondaryColor: const Color(0xFF89001B),
        backgroundColor1: const Color(0xffF9F0ED),
        backgroundColor2: const Color(0xffFDDCDC),
        backgroundColor3: const Color(0xff89001B),
        backgroundColor4: const Color(0xFF29292D),
        textColor1: Colors.black,
        textColor2: const Color(0xff89001B),
        scaffoldBackgroundColor: const Color(0xffFDDCDC),
      );

  factory CustomThemeExtension.dark() => CustomThemeExtension(
        primaryColor: const Color(0xFF874CF6),
        secondaryColor: const Color(0xFFF64CD1),
        backgroundColor1: const Color(0xFF000000),
        backgroundColor2: const Color(0xFF161616),
        backgroundColor3: const Color(0xFF1F1F1F),
        backgroundColor4: const Color(0xFF29292D),
        textColor1: const Color(0xFFFDFFFF),
        textColor2: const Color(0xFF8E8E93),
      );

  static ThemeData get darkThemeData => getThemeData(extension: CustomThemeExtension.dark());

  static ThemeData get lightThemeData => getThemeData(extension: CustomThemeExtension.light());

  static ThemeData getThemeData({required CustomThemeExtension extension}) {
    return ThemeData(
      // ignore: deprecated_member_use
      backgroundColor: extension.backgroundColor1,
      scaffoldBackgroundColor: extension.backgroundColor1,
      primaryColor: extension.primaryColor,
      extensions: [extension],
    );
  }

  TextStyle get headline1 => TextStyle(
        // 700
        color: textColor2,
        fontSize: 20.h,
        fontWeight: FontWeight.w700,
      );

  TextStyle get headline2 => TextStyle(
        // 700
        color: textColor2,
        fontSize: 16.h,
        fontWeight: FontWeight.w700,
      );

  TextStyle get headline3 => TextStyle(
        // 600
        color: primaryColor,
        fontSize: 14.h,
        fontWeight: FontWeight.w600,
      );

  TextStyle get headline4 => TextStyle(
        //500
        color: textColor2,
        fontSize: 14.h,
        fontWeight: FontWeight.w500,
      );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor1,
    Color? backgroundColor2,
    Color? backgroundColor3,
    Color? backgroundColor4,
    Color? textColor1,
    Color? textColor2,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor1: backgroundColor1 ?? this.backgroundColor1,
      backgroundColor2: backgroundColor2 ?? this.backgroundColor2,
      backgroundColor3: backgroundColor3 ?? this.backgroundColor3,
      backgroundColor4: backgroundColor4 ?? this.backgroundColor4,
      textColor1: textColor1 ?? this.textColor1,
      textColor2: textColor2 ?? this.textColor2,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
    ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor1: Color.lerp(backgroundColor1, other.backgroundColor1, t)!,
      backgroundColor2: Color.lerp(backgroundColor2, other.backgroundColor2, t)!,
      backgroundColor3: Color.lerp(backgroundColor3, other.backgroundColor3, t)!,
      backgroundColor4: Color.lerp(backgroundColor4, other.backgroundColor4, t)!,
      textColor1: Color.lerp(textColor1, other.textColor1, t)!,
      textColor2: Color.lerp(textColor2, other.textColor2, t)!,
    );
  }
}
