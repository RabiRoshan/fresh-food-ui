import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ButtonOne extends StatelessWidget {
  final String text;
  final ImageIcon prefixIcon;
  final Function onPressed;
  final bool showLoader;

  const ButtonOne({
    Key key,
    this.text = "Button Text",
    this.prefixIcon,
    this.onPressed,
    this.showLoader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showLoader)
      return CircularProgressIndicator();
    else if (Theme.of(context).platform == TargetPlatform.iOS)
      return SizedBox(
        height: 60,
        width: double.infinity,
        child: CupertinoButton(
          onPressed: !showLoader ? onPressed : null,
          disabledColor: appPrimaryColor,
          color: appPrimaryColor,
          borderRadius: const BorderRadius.all(
            const Radius.circular(
              36,
            ),
          ),
          child: generateButtonChild(context, text, prefixIcon),
        ),
      );
    else
      return Container(
        height: 60,
        width: double.infinity,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                36,
              ),
            ),
          ),
          onPressed: !showLoader ? onPressed : null,
          disabledColor: appPrimaryColor,
          color: appPrimaryColor,
          child: generateButtonChild(context, text, prefixIcon),
        ),
      );
  }
}

Widget generateButtonChild(
  BuildContext context,
  String text,
  ImageIcon prefixIcon,
) =>
    prefixIcon != null
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                prefixIcon,
                generateSpace(context, 10, horizontal: true),
                Text(
                  text,
                  style: buttonText,
                ),
              ],
            ),
          )
        : Center(
            child: Text(
              text,
              style: buttonText,
            ),
          );
