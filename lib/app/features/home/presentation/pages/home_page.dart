import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/features/home/presentation/widgets/home_carousel_widget.dart';
import 'package:lily/app/features/home/presentation/widgets/home_search_widget.dart';
import 'package:lily/app/features/home/presentation/widgets/home_tab_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              25.ph,
              const HomeSearchWidget(),
              32.ph,
              const HomeCarouselWidget(),
              8.ph,
              const HomeTabWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
