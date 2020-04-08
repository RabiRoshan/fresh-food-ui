import 'package:flutter/material.dart';

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
