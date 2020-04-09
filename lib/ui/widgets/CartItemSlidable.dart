import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants/app_constants.dart';
import '../../utils/styles.dart';

class CartItemSlidable extends StatelessWidget {
  final Image image;
  final String title;
  final String quantity;
  final String price;

  const CartItemSlidable({
    Key key,
    @required this.image,
    @required this.title,
    @required this.quantity,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          decoration: BoxDecoration(
            color: lighterGrey,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
          ),
          height: generateSize(context, 60),
          child: Row(
            children: <Widget>[
              generateSpace(context, 10, horizontal: true),
              image,
              generateSpace(context, 10, horizontal: true),
              Text(
                title,
                style: bodyDarkText,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      quantity,
                      style: bodyLightText,
                    ),
                    generateSpace(context, 10, horizontal: true),
                    Text(
                      price,
                      style: bodyDarkText,
                    ),
                  ],
                ),
              ),
              generateSpace(context, 10, horizontal: true),
            ],
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            iconWidget: ImageIcon(
              AssetImage(LocalIcons.icon_edit3x),
              color: white,
            ),
            color: lightGrey,
            onTap: () => {},
          ),
          IconSlideAction(
            iconWidget: ImageIcon(
              AssetImage(LocalIcons.icon_trash3x),
              color: white,
            ),
            color: mediumGreyOne,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
