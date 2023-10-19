import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton.h1(
      title: '',
      height: 42.h,
      width: 42.h,
      borderRadius: 36,
      onPressed: () {},
      child: const Icon(
        Icons.add_outlined,
        color: Colors.white,
      ),
    );
  }
}
