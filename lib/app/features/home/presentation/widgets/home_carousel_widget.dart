import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/assets/assets.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/features/home/presentation/widgets/home_carousel_card.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _currentIndex = 0;
  List cardList = const [
    HomeCarouselCard(name: 'bouquet', index: 0, image: BouquetsAsset.image1),
    HomeCarouselCard(name: 'indoor plant', index: 1, image: IndoorAsset.image1),
    HomeCarouselCard(name: 'outdoor plant', index: 2, image: OutdoorAsset.image1),
    HomeCarouselCard(name: 'workshop in floristry', index: 3, image: WorkshopsAsset.image1),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 142.h,
            // autoPlayInterval: const Duration(seconds: 3),
            // autoPlayAnimationDuration: const Duration(milliseconds: 800),
            // autoPlayCurve: Curves.fastOutSlowIn,
            // pauseAutoPlayOnTouch: true,
            viewportFraction: 1,
            aspectRatio: 2.0,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return SizedBox(
                height: 170.h,
                width: double.infinity,
                child: card,
              );
            });
          }).toList(),
        ),
        8.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Container(
              width: _currentIndex == index ? 42.h : 8.h,
              height: 8.h,
              margin: EdgeInsets.symmetric(horizontal: 1.h),
              decoration: BoxDecoration(
                borderRadius: _currentIndex == index ? BorderRadius.circular(10.sp) : null,
                shape: _currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
                color: _currentIndex == index ? theme.backgroundColor3 : theme.backgroundColor1,
              ),
            );
          }),
        ),
      ],
    );
  }
}
