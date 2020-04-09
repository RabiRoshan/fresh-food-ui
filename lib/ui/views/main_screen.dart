import 'package:flutter/material.dart';
import 'package:fresh_food/ui/views/cart_screen.dart';
import 'package:fresh_food/ui/views/recipes_screen.dart';
import 'package:fresh_food/ui/views/settings_screen.dart';

import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/BottomNavBars.dart';
import 'base_screen.dart';
import 'search_screen.dart';
import 'store_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MainViewMobilePortrait(
          currentScreenIndex: currentScreenIndex,
          changeScreen: _changeScreenIndex,
        ),
      ),
    );
  }

  _changeScreenIndex(value) {
    setState(() {
      currentScreenIndex = value;
    });
  }
}

class MainViewMobilePortrait extends StatelessWidget {
  final int currentScreenIndex;
  final Function changeScreen;

  const MainViewMobilePortrait(
      {Key key, this.changeScreen, this.currentScreenIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      secureScreen: true,
      child: IndexedStack(
        index: currentScreenIndex,
        children: <Widget>[
          StoreScreen(),
          RecipesScreen(),
          CartScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavBar: BottomNavBarOne(
        changeScreen: changeScreen,
        currentScreenIndex: currentScreenIndex,
      ),
    );
  }
}
