import 'package:device_preview/device_preview.dart' as devicePreview;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'constants/app_constants.dart';
import 'generated/l10n.dart';
import 'locator.dart';
import 'router.dart';
import 'utils/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Change to true to use fake repo
  setupLocator(useFakeRepo: false);

  // Lock device orientation here if needed
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      // TODO: Remove device preview on build
      devicePreview.DevicePreview(
        // enabled: !kReleaseMode,
        enabled: false,
        builder: (BuildContext context) {
          return App();
        },
      ),
    ),
  );

  // To make only bottom bar enabled and status bar hidden and so on...
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  // To set the color of status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: darkerGrey,
    statusBarIconBrightness: Brightness.light,
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Bloc Provider to provide AuthBloc globally (child: MaterialApp())
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        // TODO: Remove on build
        locale: devicePreview.DevicePreview.of(context)
            .locale, // <--- remove the locale
        // TODO: Remove on build
        builder: devicePreview.DevicePreview.appBuilder, // <--- remove

        debugShowCheckedModeBanner: false,

        title: 'Fresh Food',

        // Localization Config:
        // More details on
        // https://flutter.dev/docs/development/accessibility-and-localization/internationalization
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,

        // Navigator key to use Get.
        // More info on: https://pub.dev/packages/get
        navigatorKey: Get.key,

        onGenerateRoute: Router.generateRoute,
        theme: ThemeData(
          primarySwatch: appPrimarySwatch,
        ),
      ),
    );
  }
}

class RootWidget extends StatefulWidget {
  RootWidget({Key key}) : super(key: key);

  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Get.offAllNamed(MainRoute);
        } else if (state is UnauthenticatedState) {
          Get.offAllNamed(SignInRoute);
        }
      },
      builder: (context, state) {
        // Show loading indicator until AuthBloc is initialized
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(LocalImages.logo),
              generateSpace(context, 10),
              CircularProgressIndicator(),
            ],
          ),
        ));
      },
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    // To show loading indicator for atleast 2 seconds on app startup
    await Future.delayed(Duration(seconds: 2));

    // Try auto Sign In
    BlocProvider.of<AuthBloc>(context).add(AutoSignInEvent());

    super.didChangeDependencies();
  }
}
