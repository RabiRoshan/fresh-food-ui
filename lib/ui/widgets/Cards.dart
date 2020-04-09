import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constants.dart';

import '../../utils/styles.dart';

class CardOne extends StatelessWidget {
  final Widget child;
  final double height;
  final EdgeInsets padding;

  const CardOne({Key key, this.child, @required this.height, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: height,
          width: MediaQuery.of(context).size.width / 2,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
              bottom: Radius.circular(36),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: 6,
                offset: Offset(
                  0.0,
                  1.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          padding: padding,
          decoration: BoxDecoration(
            // color: Colors.transparent,
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
              bottom: Radius.circular(36),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(
                  0.0,
                  1.0,
                ),
              ),
            ],
          ),
          child: child,
        ),
      ],
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
        // TODO: Apply box shadow
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 5.0,
        //     offset: Offset(
        //       0.0,
        //       0.0,
        //     ),
        //   ),
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 20,
        //     spreadRadius: -100,
        //     offset: Offset(
        //       0.0,
        //       100.0,
        //     ),
        //   )
        // ],
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
        // TODO: Apply box shadow
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 5.0,
        //     offset: Offset(
        //       0.0,
        //       0.0,
        //     ),
        //   ),
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 20,
        //     spreadRadius: -100,
        //     offset: Offset(
        //       0.0,
        //       100.0,
        //     ),
        //   )
        // ],
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
