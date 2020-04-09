import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Cards.dart';
import 'base_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: SettingsViewMobilePortrait(),
      ),
    );
  }
}

class SettingsViewMobilePortrait extends StatelessWidget {
  const SettingsViewMobilePortrait({Key key}) : super(key: key);

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
                S.of(context).settings,
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
