import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final int height;
  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.hintText = '',
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        color: const Color(0xffF9F0ED),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 4.h,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
