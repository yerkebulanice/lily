import 'package:flutter/material.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/features/shop/presentation/widgets/shop_card_item.dart';

class ShopCardList extends StatelessWidget {
  const ShopCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: 2,
      itemBuilder: (context, index) => ShopCardItem(i: index),
      separatorBuilder: (context, index) => 40.ph,
    );
  }
}
