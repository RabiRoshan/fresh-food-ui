import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Cards.dart';
import 'base_screen.dart';

class RecipesScreen extends StatefulWidget {
  RecipesScreen({Key key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: RecipesViewMobilePortrait(),
      ),
    );
  }
}

class RecipesViewMobilePortrait extends StatelessWidget {
  const RecipesViewMobilePortrait({Key key}) : super(key: key);

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
                S.of(context).recipes,
                style: h3Text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
