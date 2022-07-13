import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc/Api/api.dart';
import 'package:mrc/Screens/DetailPages/detail_page.dart';
import 'package:mrc/Screens/Home/homepage.dart';
import 'package:mrc/Screens/Notifications/notifications.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../utils/data.dart';
import '../../utils/utils.dart';
import '../Profile/profile.dart';
import '../ResultantScreen/resultant.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //list of screen to display through navigation bar
  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const NotificationsScreen(),
      ResultantScreen(
        appBarTitle: "Explore",
        backButton: false,
        givenList: universityList,
      ),
      DetailPage(
        appBarText: 'Favourities',
        backIcon: false,
        future: Api.getUniversities(),
      ),
      const Profile()
    ];
  }

  //This index will indicate the selected index of the bottom nav bar

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        iconSize: 25,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_outlined),
        title: ("Settings"),
        iconSize: 25,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.explore_outlined),
        title: ("Home"),
        iconSize: 25,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: ("Home"),
        iconSize: 25,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Settings"),
        iconSize: 25,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 50,
      screens: _buildScreens(),
      items: _navBarsItems(),
      bottomScreenMargin: 50,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
