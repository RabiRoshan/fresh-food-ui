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

const green = const Color(0XFF7BED8D);
const white = Colors.white;
const lighterGrey = Color(0XFFF0F4F8);
const lightGrey = const Color(0XFFDBE2ED);
const mediumGreyOne = const Color(0XFFA6BCD0);
const mediumGreyTwo = const Color(0XFF748A9D);
const darkGrey = const Color(0XFF4E5D6A);
const darkerGrey = const Color(0XFF404E5A);

// Fonts
const String roboto = "Roboto";

// Text Styles
const TextStyle h1Text = TextStyle(fontSize: 30, color: mediumGreyTwo);
const TextStyle h2Text = TextStyle(fontSize: 24, color: mediumGreyTwo);
const TextStyle h3Text = TextStyle(fontSize: 20, color: mediumGreyTwo);
const TextStyle h2Green = TextStyle(fontSize: 24, color: green);

const TextStyle bodyDarkText =
    TextStyle(fontSize: 16, color: mediumGreyTwo, fontWeight: FontWeight.w500);
const TextStyle bodyLightText =
    TextStyle(fontSize: 16, color: mediumGreyOne, fontWeight: FontWeight.w500);
const TextStyle bodySmallLightText =
    TextStyle(fontSize: 14, color: mediumGreyOne, fontWeight: FontWeight.w500);
const TextStyle bodyGreenText =
    TextStyle(fontSize: 16, color: green, fontWeight: FontWeight.w500);
const TextStyle linkText =
    TextStyle(fontSize: 14, color: mediumGreyOne, fontWeight: FontWeight.bold);
const TextStyle buttonText =
    TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.bold);

// Spaces - General
const SizedBox vSpace5 = SizedBox(height: 5);
const SizedBox vSpace10 = SizedBox(height: 10);
const SizedBox vSpace15 = SizedBox(height: 15);
const SizedBox vSpace20 = SizedBox(height: 20);
const SizedBox vSpace30 = SizedBox(height: 30);
const SizedBox vSpace40 = SizedBox(height: 40);
const SizedBox vSpace50 = SizedBox(height: 50);
const SizedBox vSpace60 = SizedBox(height: 60);
const SizedBox vSpace70 = SizedBox(height: 70);

const SizedBox hSpace5 = SizedBox(width: 5);
const SizedBox hSpace10 = SizedBox(width: 10);
const SizedBox hSpace15 = SizedBox(width: 15);
const SizedBox hSpace20 = SizedBox(width: 20);
const SizedBox hSpace30 = SizedBox(width: 30);
const SizedBox hSpace40 = SizedBox(width: 40);
const SizedBox hSpace50 = SizedBox(width: 50);
const SizedBox hSpace60 = SizedBox(width: 60);
const SizedBox hSpace70 = SizedBox(width: 70);

// Generate size
double generateSize(BuildContext context, double value,
        {bool fromHeight = false}) =>
    fromHeight
        ? value / BASE_HEIGHT * MediaQuery.of(context).size.height
        : value / BASE_WIDTH * MediaQuery.of(context).size.width;

// Generate Space
SizedBox generateSpace(BuildContext context, double value,
    {bool vertical = true, bool fromHeight = false}) {
  return vertical
      ? SizedBox(
          height: generateSize(context, value, fromHeight: fromHeight),
        )
      : SizedBox(
          width: generateSize(context, value, fromHeight: fromHeight),
        );
}
