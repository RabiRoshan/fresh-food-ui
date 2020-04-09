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
            index: 0,
            changeScreen: changeScreen,
            currentScreenIndex: currentScreenIndex,
            iconPath: LocalIcons.icon_store3x,
          ),
          BottomNavBarItemOne(
            index: 1,
            changeScreen: changeScreen,
            currentScreenIndex: currentScreenIndex,
            iconPath: LocalIcons.icon_recipes3x,
          ),
          Image.asset(
            LocalIcons.icon_quick_shop3x,
            height: generateSize(context, 49),
          ),
          BottomNavBarItemOne(
            index: 2,
            changeScreen: changeScreen,
            currentScreenIndex: currentScreenIndex,
            iconPath: LocalIcons.icon_cart3x,
          ),
          BottomNavBarItemOne(
            index: 3,
            changeScreen: changeScreen,
            currentScreenIndex: currentScreenIndex,
            iconPath: LocalIcons.icon_settings3x,
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
    @required this.iconPath,
    @required this.index,
  }) : super(key: key);

  final Function changeScreen;
  final int currentScreenIndex;
  final int index;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => changeScreen(index),
      icon: ImageIcon(AssetImage(iconPath)),
      color: currentScreenIndex == index ? appPrimaryColor : mediumGreyTwo,
    );
  }
}
