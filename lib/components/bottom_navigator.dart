import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_planner/theme/app_theme.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _bottomNavIndex;

  @override
  void initState() {
    super.initState();
    this._bottomNavIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [
        FontAwesomeIcons.home,
        FontAwesomeIcons.calendarAlt,
        FontAwesomeIcons.userGraduate,
        FontAwesomeIcons.bars,
      ],
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) {
        _bottomNavIndex = index;
        this.setState(() {});
      },
      activeColor: strongDeppOrange,
      //other params
    );
  }
}
