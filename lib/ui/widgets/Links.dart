import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class LinkOne extends StatelessWidget {
  final String route;
  final String text;
  final bool replaceCurrentRoute;
  final bool replaceAllRoute;

  const LinkOne(
      {Key key,
      @required this.route,
      @required this.text,
      this.replaceCurrentRoute = false,
      this.replaceAllRoute = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (replaceAllRoute)
          Get.offAllNamed(route);
        else if (replaceCurrentRoute)
          Get.offNamed(route);
        else
          Get.toNamed(route);
      },
      child: Text(
        text,
        style: linkText,
      ),
    );
  }
}
