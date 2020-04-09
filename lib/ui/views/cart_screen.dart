import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Cards.dart';
import 'base_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: CartViewMobilePortrait(),
      ),
    );
  }
}

class CartViewMobilePortrait extends StatelessWidget {
  const CartViewMobilePortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardOne(
          child: Container(
            height: generateSize(context, 507, fromHeight: true),
            width: double.infinity,
            padding: EdgeInsets.only(
              top: generateSize(context, 69, fromHeight: true),
              left: generateSize(context, 30),
              right: generateSize(context, 30),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        S.of(context).cart,
                        style: h3Text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ImageIcon(
                      AssetImage(LocalIcons.icon_search3x),
                      size: h3Text.fontSize,
                      color: h3Text.color,
                    ),
                  ],
                ),
                generateSpace(context, 5, fromHeight: true),
                Image.asset(
                  LocalImages.broccoli3x,
                  height: generateSize(context, 293, fromHeight: true),
                  width: generateSize(context, 293, fromHeight: true),
                ),
                generateSpace(context, 5, fromHeight: true),
                Text(
                  S.of(context).vegetables,
                  style: h1Text,
                ),
                generateSpace(context, 5, fromHeight: true),
                Text(
                  S.of(context).browse,
                  style: bodyLightText,
                ),
              ],
            ),
          ),
        ),
        generateSpace(context, 15, fromHeight: true),
        Container(
          height: generateSize(context, 183, fromHeight: true),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              generateSpace(context, 50, horizontal: true, fromHeight: true),
              CardTwo(
                imagePath: LocalImages.strawberry3x,
                bgColor: strawBerryRed,
                title: S.of(context).berries,
              ),
              generateSpace(context, 15, horizontal: true, fromHeight: true),
              CardTwo(
                imagePath: LocalImages.orange3x,
                bgColor: fruitOrange,
                title: S.of(context).citrus,
              ),
              generateSpace(context, 15, horizontal: true, fromHeight: true),
              CardTwo(
                imagePath: LocalImages.banana3x,
                bgColor: yellowBanana,
                title: S.of(context).tropical,
              ),
              generateSpace(context, 15, horizontal: true, fromHeight: true),
              CardThree(
                iconPath: LocalIcons.icon_search3x,
                bgColor: mediumGreyTwo,
                title: S.of(context).more,
              ),
              generateSpace(context, 15, horizontal: true, fromHeight: true),
            ],
          ),
        )
      ],
    );
  }
}
