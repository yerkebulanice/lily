import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/ui/custom_textfield.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({super.key});

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _searchController,
            hintText: 'Search',
            height: 42,
          ),
        ),
        12.pw,
        CustomButton.h1(
          width: 42.h,
          height: 42.h,
          title: '',
          onPressed: () {},
          child: Icon(Icons.tune_outlined, size: 24.sp),
        )
      ],
    );
  }
}
