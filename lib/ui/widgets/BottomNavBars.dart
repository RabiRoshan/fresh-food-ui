import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../utils/styles.dart';

class BottomNavBarOne extends StatelessWidget {
  const BottomNavBarOne({
    Key key,
    @required this.changeScreen,
    @required this.currentScreenIndex,
  }) : super(key: key);

  final Function changeScreen;
  final int currentScreenIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: generateSize(context, 40),
        vertical: generateSize(context, 15, fromHeight: true),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavBarItemOne(
              changeScreen: changeScreen,
              currentScreenIndex: currentScreenIndex),
          IconButton(
            onPressed: () {
              changeScreen(1);
            },
            icon: ImageIcon(AssetImage(LocalIcons.icon_recipes3x)),
            color: currentScreenIndex == 1 ? green : null,
          ),
          Image.asset(
            LocalIcons.icon_quick_shop3x,
            height: generateSize(context, 49),
          ),
          IconButton(
            onPressed: () {
              changeScreen(2);
            },
            icon: ImageIcon(AssetImage(LocalIcons.icon_cart3x)),
            color: currentScreenIndex == 2 ? green : null,
          ),
          IconButton(
            onPressed: () {
              changeScreen(3);
            },
            icon: ImageIcon(AssetImage(LocalIcons.icon_settings3x)),
            color: currentScreenIndex == 3 ? green : null,
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItemOne extends StatelessWidget {
  const BottomNavBarItemOne({
    Key key,
    @required this.changeScreen,
    @required this.currentScreenIndex,
  }) : super(key: key);

  final Function changeScreen;
  final int currentScreenIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        changeScreen(0);
      },
      icon: ImageIcon(AssetImage(LocalIcons.icon_store3x)),
      color: currentScreenIndex == 0 ? green : null,
    );
  }
}
