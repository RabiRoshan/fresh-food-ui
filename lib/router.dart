import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'main.dart';
import 'ui/views/create_account_screen.dart';
import 'ui/views/main_screen.dart';
import 'ui/views/search_screen.dart';
import 'ui/views/sign_in_screen.dart';

const String SignInRoute = '/signin';
const String CreateAccountRoute = '/createaccount';
const String SearchRoute = '/search';
const String MainRoute = '/main';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetRoute(page: RootWidget(), settings: settings);
      case SignInRoute:
        return GetRoute(settings: settings, page: SignInScreen());
      case CreateAccountRoute:
        return GetRoute(settings: settings, page: CreateAccountScreen());
      case SearchRoute:
        return GetRoute(settings: settings, page: SearchScreen());
      case MainRoute:
        return GetRoute(settings: settings, page: MainScreen());

      default:
        return GetRoute(
          settings: settings,
          page: Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
