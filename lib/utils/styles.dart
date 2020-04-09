import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Base Size
const BASE_WIDTH = 375;
const BASE_HEIGHT = 812;

// Colors
const Map<int, Color> color = {
  50: Color.fromRGBO(123, 237, 141, .1),
  100: Color.fromRGBO(123, 237, 141, .2),
  200: Color.fromRGBO(123, 237, 141, .3),
  300: Color.fromRGBO(123, 237, 141, .4),
  400: Color.fromRGBO(123, 237, 141, .5),
  500: Color.fromRGBO(123, 237, 141, .6),
  600: Color.fromRGBO(123, 237, 141, .7),
  700: Color.fromRGBO(123, 237, 141, .8),
  800: Color.fromRGBO(123, 237, 141, .9),
  900: Color.fromRGBO(123, 237, 141, 1),
};

const MaterialColor appPrimarySwatch = MaterialColor(0XFF7BED8D, color);
const appPrimaryColor = appPrimarySwatch;

const white = Colors.white;
const lighterGrey = Color(0XFFF0F4F8);
const lightGrey = const Color(0XFFDBE2ED);
const mediumGreyOne = const Color(0XFFA6BCD0);
const mediumGreyTwo = const Color(0XFF748A9D);
const darkGrey = const Color(0XFF4E5D6A);
const darkerGrey = const Color(0XFF404E5A);

const strawBerryRed = const Color(0XFFDD4040);
const fruitOrange = const Color(0XFFFFA700);
const yellowBanana = const Color(0XFFFFD958);
const greenApple = const Color(0XFFD2F475);

// Fonts
const String roboto = "Roboto";

// Text Styles
const TextStyle h1Text = TextStyle(fontSize: 30, color: mediumGreyTwo);
const TextStyle h2Text = TextStyle(fontSize: 24, color: mediumGreyTwo);
const TextStyle h3Text = TextStyle(fontSize: 20, color: mediumGreyTwo);
const TextStyle h2PrimaryColor =
    TextStyle(fontSize: 24, color: appPrimaryColor);

const TextStyle bodyWhiteText =
    TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w500);
const TextStyle bodyDarkText =
    TextStyle(fontSize: 16, color: mediumGreyTwo, fontWeight: FontWeight.w500);
const TextStyle bodyLightText =
    TextStyle(fontSize: 16, color: mediumGreyOne, fontWeight: FontWeight.w500);
const TextStyle bodySmallLightText =
    TextStyle(fontSize: 14, color: mediumGreyOne, fontWeight: FontWeight.w500);
const TextStyle bodyPrimaryColorText = TextStyle(
    fontSize: 16, color: appPrimaryColor, fontWeight: FontWeight.w500);
const TextStyle linkText =
    TextStyle(fontSize: 14, color: mediumGreyOne, fontWeight: FontWeight.bold);
const TextStyle buttonText =
    TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.bold);

// Generate size
double generateSize(BuildContext context, double value,
        {bool fromHeight = false}) =>
    fromHeight
        ? value / BASE_HEIGHT * MediaQuery.of(context).size.height
        : value / BASE_WIDTH * MediaQuery.of(context).size.width;

// Generate Space
SizedBox generateSpace(BuildContext context, double value,
    {bool horizontal = false, bool fromHeight = false}) {
  return horizontal
      ? SizedBox(
          width: generateSize(context, value, fromHeight: fromHeight),
        )
      : SizedBox(
          height: generateSize(context, value, fromHeight: fromHeight),
        );
}
