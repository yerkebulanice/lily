import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/extensions/sizedbox_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/data/type_bloc/type_bloc.dart';
import 'package:lily/app/features/product/product_item.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({super.key});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  late TypeBloc bloc;

  @override
  void initState() {
    bloc = globalSL<TypeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      children: [
        BlocConsumer<TypeBloc, TypeState>(
          bloc: bloc,
          listener: (context, state) {
            print('State Lis is: $state');
            if (state is ChangeTypeState) {
              setState(() {});
            }
          },
          builder: (context, state) {
            print('State is :$state');
            if (state is ChangeTypeState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab(theme, 'Bouquets', state.type[0].isSelected, 0),
                  _buildTab(theme, 'Indoor', state.type[1].isSelected, 1),
                  _buildTab(theme, 'Outdoor', state.type[2].isSelected, 2),
                  _buildTab(theme, 'Workshop', state.type[3].isSelected, 3),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab(theme, 'Bouquets', true, 0),
                _buildTab(theme, 'Indoor', false, 1),
                _buildTab(theme, 'Outdoor', false, 2),
                _buildTab(theme, 'Workshop', false, 3),
              ],
            );
          },
        ),
        24.ph,
        GridView.builder(
          shrinkWrap: true,
          itemCount: bloc.getSelected.flowers.length,
          primary: false,
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              flower: bloc.getSelected.flowers[index],
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
    );
  }

  Widget _buildTab(CustomThemeExtension theme, String name, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        bloc.add(ChangeTypeEvent(index));
      },
      child: SizedBox(
        height: 30.h,
        child: Column(
          children: [
            Text(
              name,
              style: theme.headline2.copyWith(
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            4.ph,
            Container(
              height: 2.h,
              width: 72.w,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
