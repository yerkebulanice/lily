import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/ui/custom_textfield.dart';
import 'package:lily/app/features/shop/presentation/widgets/shop_bill_item.dart';
import 'package:lily/app/features/shop/presentation/widgets/shop_card_list.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _promoController = TextEditingController();
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
                'My Cart',
                style: theme.headline1.copyWith(fontSize: 32.h),
              ),
              20.ph,
              const ShopCardList(),
              36.ph,
              Text(
                'Promo code',
                style: theme.headline3.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              10.ph,
              CustomTextField(
                controller: _promoController,
                hintText: 'XSY123',
                height: 60,
              ),
              24.ph,
              Text(
                'Bill details',
                style: theme.headline1.copyWith(
                  color: Colors.black,
                  fontSize: 28.h,
                ),
              ),
              16.ph,
              const ShopBillItem(
                text: 'Item total',
                price: '24 000 KZT',
              ),
              8.ph,
              const ShopBillItem(
                text: 'Delivery',
                price: '2300 KZT',
              )
            ],
          ),
        ),
      ),
    );
  }
}
