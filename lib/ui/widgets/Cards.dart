import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constants.dart';

import '../../utils/styles.dart';

class CardOne extends StatelessWidget {
  final Widget child;

  const CardOne({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
          bottom: Radius.circular(36),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: -100,
            offset: Offset(
              0.0,
              100.0,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}

class CardTwo extends StatelessWidget {
  final String imagePath;
  final Color bgColor;
  final String title;
  const CardTwo({Key key, this.imagePath, this.bgColor, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: generateSize(context, 150, fromHeight: true),
      padding: EdgeInsets.only(
        bottom: generateSize(context, 10, fromHeight: true),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          colorFilter: ColorFilter.mode(
            bgColor,
            BlendMode.darken,
          ),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: -100,
            offset: Offset(
              0.0,
              100.0,
            ),
          )
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: bodyWhiteText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  final String iconPath;
  final Color bgColor;
  final String title;
  const CardThree({Key key, this.iconPath, this.bgColor, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: generateSize(context, 150, fromHeight: true),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: -100,
            offset: Offset(
              0.0,
              100.0,
            ),
          )
        ],
      ),
      child: Center(
        child: ImageIcon(
          AssetImage(LocalIcons.icon_search3x),
          color: white,
        ),
      ),
    );
  }
}
