import 'package:flutter/material.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';

class ShopBillItem extends StatelessWidget {
  final String text;
  final String price;
  const ShopBillItem({
    super.key,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.headline1.copyWith(
            color: theme.textColor1,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          price,
          style: theme.headline2.copyWith(color: theme.textColor1),
        )
      ],
    );
  }
}
