import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lily/app/config/ui/custom_theme_extension.dart';
import 'package:lily/app/core/service-locator/service_locator_manager.dart';
import 'package:lily/app/navigation/auth_navigation.dart';

enum BottomBar { home, shop, favorite, profile }

class HomeNavigationPage extends StatefulWidget {
  const HomeNavigationPage({super.key});

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  final Map<BottomBar, GlobalKey<NavigatorState>> _navigators = {
    BottomBar.home: GlobalKey<NavigatorState>(),
    BottomBar.shop: GlobalKey<NavigatorState>(),
    BottomBar.favorite: GlobalKey<NavigatorState>(),
    BottomBar.profile: GlobalKey<NavigatorState>(),
  };
  final Map<BottomBar, GoRouter> _routes = {
    BottomBar.home: globalSL<AuthNavigation>().homeRoutes,
    BottomBar.shop: globalSL<AuthNavigation>().shopRoutes,
    BottomBar.favorite: globalSL<AuthNavigation>().favoriteRoutes,
    BottomBar.profile: globalSL<AuthNavigation>().profileRoutes,
  };
  BottomBar currentBar = BottomBar.home;

  Future<bool> onWillPop() async {
    final bool canPop = await _navigators[currentBar]!.currentState!.maybePop();
    if (!canPop && currentBar != BottomBar.home) {
      selectPage(BottomBar.home);
      return false;
    }
    return !canPop;
  }

  void selectPage(BottomBar newSelectedBar) {
    setState(() {
      currentBar = newSelectedBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar,
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildPage(BottomBar.home),
        _buildPage(BottomBar.shop),
        _buildPage(BottomBar.favorite),
        _buildPage(BottomBar.profile),
      ],
    );
  }

  Widget _buildPage(BottomBar bottomBar) {
    return Offstage(
      offstage: currentBar != bottomBar,
      child: MaterialApp.router(
        routeInformationParser: _routes[bottomBar]!.routeInformationParser,
        routerDelegate: _routes[bottomBar]!.routerDelegate,
        routeInformationProvider: _routes[bottomBar]!.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: CustomThemeExtension.lightThemeData,
        darkTheme: CustomThemeExtension.darkThemeData,
        themeMode: ThemeMode.light,
      ),
    );
  }

  Widget get _buildBottomNavBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.sp)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.sp),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentBar.index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            onTap: (index) => selectPage(BottomBar.values[index]),
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                  icon: Icons.home_outlined,
                  bar: BottomBar.home,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  icon: Icons.shopping_bag_outlined,
                  bar: BottomBar.shop,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  icon: Icons.favorite_outline_outlined,
                  bar: BottomBar.favorite,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  icon: Icons.person_outline_outlined,
                  bar: BottomBar.profile,
                ),
                label: '',
              ),
            ],
          ),
        ));
  }

  Widget _buildIcon({
    required IconData icon,
    required BottomBar bar,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h, top: 10.h),
      child: SizedBox(
        width: 60.h,
        height: 30.h,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          currentBar == bar
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    width: 60.h,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff89001B).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(6.sp),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ]),
      ),
    );
  }
}
