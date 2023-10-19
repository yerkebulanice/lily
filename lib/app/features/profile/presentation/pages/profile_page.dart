import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_button.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:lily/app/features/profile/presentation/widgets/profile_recent_view_widget.dart';
import 'package:lily/app/features/unauth/presentation/bloc/auth/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            bottom: 30.h,
            top: 25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile',
                style: theme.headline1.copyWith(fontSize: 32.h),
              ),
              24.ph,
              const ProfileInfoWidget(),
              24.ph,
              Container(
                width: double.infinity,
                height: 2.h,
                color: Colors.grey,
              ),
              24.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent view items',
                    style: theme.headline2.copyWith(color: Colors.black),
                  ),
                  Text(
                    'See all',
                    style: theme.headline4.copyWith(color: Colors.grey),
                  )
                ],
              ),
              24.ph,
              const ProfileRecentViewWidget(),
              24.ph,
              CustomButton.h1(
                title: 'Go to my orders',
                width: double.infinity,
                height: 48.h,
                borderRadius: 8,
                color: theme.backgroundColor1,
                textColor: theme.backgroundColor3,
                fontSize: 24.h,
                onPressed: () {},
              ),
              40.ph,
              _buildItem(theme, 'Privacy policy'),
              24.ph,
              _buildItem(theme, 'Terms of service'),
              24.ph,
              _buildItem(theme, 'Contact us'),
              24.ph,
              CustomButton.h1(
                title: 'Sign Out',
                width: double.infinity,
                height: 44.h,
                onPressed: () {
                  globalSL<AuthBloc>().add(LogOutAuthEvent());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(CustomThemeExtension theme, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: theme.headline2.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 24.h,
          width: 24.h,
          child: const Icon(Icons.arrow_forward_outlined),
        ),
      ],
    );
  }
}
