import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../router.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Buttons.dart';
import '../widgets/Cards.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailedState) {
          Get.snackbar(S.of(context).loginError, state.error.error);
        } else if (state is AuthenticatedState) {
          Get.offAllNamed(HomeRoute);
        }
      },
      builder: (context, state) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: LoginViewMobilePortrait(
            emailController: emailController,
            passwordController: passwordController,
            onLoginPressed: _login,
            isLoggingIn: state is AuthenticatingState ?? false,
          ),
        ),
      ),
    );
  }

  _login() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        emailController.text,
        passwordController.text,
      ),
    );
  }
}

class LoginViewMobilePortrait extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onLoginPressed;
  final isLoggingIn;

  const LoginViewMobilePortrait(
      {Key key,
      this.emailController,
      this.passwordController,
      this.onLoginPressed,
      this.isLoggingIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      secureScreen: false,
      child: Column(
        children: <Widget>[
          CardOne(
            child: Container(
              height: generateSize(context, 707, fromHeight: true),
              padding: EdgeInsets.only(
                top: generateSize(context, 149, fromHeight: true),
                bottom: generateSize(context, 30, fromHeight: true),
                left: generateSize(context, 30, fromHeight: true),
                right: generateSize(context, 30, fromHeight: true),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          S.of(context).signIn,
                          style: h2Green,
                        ),
                        generateSpace(context, 111, fromHeight: true),
                        TextFieldOne(
                          hintText: S.of(context).email,
                          controller: emailController,
                          prefixIconImage: AssetImage(LocalIcons.icon_mail),
                        ),
                        generateSpace(context, 15, fromHeight: true),
                        TextFieldOne(
                          hintText: S.of(context).password,
                          controller: passwordController,
                          prefixIconImage: AssetImage(LocalIcons.icon_padlock),
                          obscureText: true,
                        ),
                        generateSpace(context, 29, fromHeight: true),
                        Text(
                          S.of(context).forgotPassword,
                          style: bodyLightText,
                        ),
                      ],
                    ),
                  ),
                  ButtonOne(
                    text: S.of(context).signIn.toUpperCase(),
                    prefixIcon: ImageIcon(
                      AssetImage(
                        LocalIcons.icon_arrow_small2x,
                      ),
                      size: 14,
                      color: white,
                    ),
                    showLoader: isLoggingIn,
                    onPressed: () {
                      onLoginPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
          generateSpace(context, 42, fromHeight: true),
          Text(
            S.of(context).createAccount,
            style: linkText,
          ),
        ],
      ),
    );
  }
}
