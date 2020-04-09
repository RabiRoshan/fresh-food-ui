import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../router.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Buttons.dart';
import '../widgets/Cards.dart';
import '../widgets/Links.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: CreateAccountViewMobilePortrait(
            emailController: emailController,
            passwordController: passwordController,
            fullNameController: fullNameController,
            onCreateAccountPressed: _createAccount,
            isCreatingAccount: state is AuthenticatingState ?? false,
          ),
        ),
      ),
    );
  }

  _createAccount() {
    BlocProvider.of<AuthBloc>(context).add(
      AccountCreateEvent(
        fullNameController.text,
        emailController.text,
        passwordController.text,
      ),
    );
  }
}

class CreateAccountViewMobilePortrait extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController fullNameController;
  final Function onCreateAccountPressed;
  final isCreatingAccount;

  const CreateAccountViewMobilePortrait(
      {Key key,
      this.emailController,
      this.passwordController,
      this.onCreateAccountPressed,
      this.isCreatingAccount = false,
      this.fullNameController})
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
                left: generateSize(context, 30),
                right: generateSize(context, 30),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          S.of(context).createAccount,
                          style: h2Green,
                        ),
                        generateSpace(context, 111, fromHeight: true),
                        TextFieldOne(
                          hintText: S.of(context).fullName,
                          controller: fullNameController,
                          prefixIconImage: AssetImage(LocalIcons.icon_account),
                        ),
                        generateSpace(context, 15, fromHeight: true),
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
                      ],
                    ),
                  ),
                  ButtonOne(
                    text: S.of(context).createAccount.toUpperCase(),
                    prefixIcon: ImageIcon(
                      AssetImage(
                        LocalIcons.icon_arrow_small2x,
                      ),
                      size: 14,
                      color: white,
                    ),
                    showLoader: isCreatingAccount,
                    onPressed: () {
                      onCreateAccountPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
          generateSpace(context, 42, fromHeight: true),
          LinkOne(
            text: S.of(context).signIn,
            route: SignInRoute,
            replaceAllRoute: true,
          )
        ],
      ),
    );
  }
}
