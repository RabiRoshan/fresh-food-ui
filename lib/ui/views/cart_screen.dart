import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Buttons.dart';
import '../widgets/Cards.dart';
import '../widgets/CartItemSlidable.dart';

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
    return Container(
      height: generateSize(context, 710, fromHeight: true),
      child: Column(
        children: <Widget>[
          CardOne(
            height: generateSize(context, 124, fromHeight: true),
            padding: EdgeInsets.only(
              top: generateSize(context, 69, fromHeight: true),
            ),
            child: Container(
              child: Text(
                S.of(context).cart,
                style: h3Text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: generateSize(context, 270),
            width: generateSize(context, 315),
            child: FadingEdgeScrollView.fromScrollView(
              child: ListView.separated(
                controller: ScrollController(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index % 4 == 0)
                    return CartItemSlidable(
                      image: Image.asset(
                        LocalImages.broccoli,
                        width: generateSize(context, 46),
                      ),
                      title: "Brocolli",
                      quantity: '2 heads',
                      price: '\$0.80',
                    );
                  else if (index % 3 == 0)
                    return CartItemSlidable(
                      image: Image.asset(
                        LocalImages.strawberry,
                        width: generateSize(context, 46),
                      ),
                      title: "Strawberry",
                      quantity: '2 punnets',
                      price: '\$4.00',
                    );
                  else if (index % 2 == 0)
                    return CartItemSlidable(
                      image: Image.asset(
                        LocalImages.pepper,
                        width: generateSize(context, 46),
                      ),
                      title: "Red Peppers",
                      quantity: '5',
                      price: '\$1.50',
                    );
                  else
                    return CartItemSlidable(
                      image: Image.asset(
                        LocalImages.kale,
                        width: generateSize(context, 46),
                      ),
                      title: "Kale",
                      quantity: '300g',
                      price: '\$3.00',
                    );
                },
                separatorBuilder: (context, index) =>
                    generateSpace(context, 15, fromHeight: true),
              ),
            ),
          ),
          generateSpace(context, 50, fromHeight: true),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: generateSize(context, 30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sub-Total",
                            style: bodyDarkText,
                          ),
                          Text(
                            "\$9.30",
                            style: bodyDarkText,
                          ),
                        ],
                      ),
                      generateSpace(context, 12, fromHeight: true),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Delivery",
                            style: bodyDarkText,
                          ),
                          Text(
                            "Standard (free)",
                            style: bodyDarkText,
                          ),
                        ],
                      ),
                      generateSpace(context, 12, fromHeight: true),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: h2Text,
                          ),
                          Text(
                            "\$9.30",
                            style: h2Text,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ButtonOne(
                    text: "CHECKOUT",
                    prefixIcon: ImageIcon(
                      AssetImage(
                        LocalIcons.icon_arrow_small2x,
                      ),
                      size: 14,
                      color: white,
                    ),
                    // showLoader: isLoggingIn,
                    onPressed: () {
                      // onSignInPressed();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
