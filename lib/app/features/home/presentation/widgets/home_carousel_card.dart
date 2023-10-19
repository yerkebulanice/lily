import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/data/type_bloc/type_bloc.dart';

class HomeCarouselCard extends StatelessWidget {
  final String name;
  final int index;
  final String image;
  const HomeCarouselCard({
    super.key,
    required this.name,
    required this.index,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor1,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todays popular \n$name',
                style: theme.headline2.copyWith(fontWeight: FontWeight.normal),
              ),
              CustomButton.h1(
                title: '',
                width: 92.w,
                height: 34.h,
                child: Text(
                  'Buy',
                  style: theme.headline2.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  globalSL<TypeBloc>().add(ChangeTypeEvent(index));
                },
              ),
            ],
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}
