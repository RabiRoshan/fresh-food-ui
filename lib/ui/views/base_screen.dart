import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../router.dart';
import '../../utils/styles.dart';

// This is customized according to your app.
// Here this screen serves to provide a common scaffold background and
// to redirect to signIn screen if unauthenticated (if secureScreen is true).

class BaseScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool secureScreen;
  final Widget bottomNavBar;

  const BaseScreen(
      {Key key,
      this.child,
      this.padding,
      this.secureScreen = true,
      this.bottomNavBar})
      : super(key: key);

  redirectToSignIn() {
    Get.offAllNamed(SignInRoute);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (secureScreen && state is UnauthenticatedState) redirectToSignIn();
      },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: padding,
              width: double.infinity,
              decoration: BoxDecoration(color: white),
              child: child,
            ),
          ),
          bottomNavigationBar: bottomNavBar),
    );
  }
}
