import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/data/type_bloc/type_bloc.dart';
import 'package:lily/app/features/product/product_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 15.h,
            top: 25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorites',
                style: theme.headline1.copyWith(fontSize: 32.h),
              ),
              24.ph,
              GridView.builder(
                shrinkWrap: true,
                itemCount: globalSL<TypeBloc>().getSelected.flowers.length,
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    flower: globalSL<TypeBloc>().getSelected.flowers[index],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 25.w,
                  childAspectRatio: 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
