import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/bloc2/bloc_class2.dart';
import 'package:pythagoras/bloc2/bloc_states2.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/providers/user_provider.dart';
import 'package:pythagoras/services/check_connct_internet.dart';
import 'package:pythagoras/services/connectivity.dart';
import 'package:pythagoras/services/notification.dart';
import 'package:pythagoras/services/notification_handler.dart';
import 'package:pythagoras/services/socket_class.dart';
import 'package:pythagoras/services/sp_helper.dart';
import 'package:pythagoras/splash_screen.dart';
import 'package:pythagoras/values/images_name.dart';

import 'bloc/bloc_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  int co = await SPHelper.spHelper.getCountNotification();

  // initSvg();
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, backgroundlogin), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, homeimage), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, classes), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, paymentbuttom), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, tlgb), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, backgroundsplash), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, logospalsh), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, container5), null);
  await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, splashback), null);
  runApp(co == null ? MyApp(0) : MyApp(co));
}

class MyApp extends StatefulWidget {
  int cou;
  MyApp(this.cou);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityService connectivityService;
  @override
  void initState() {
    super.initState();
    connectivityService = ConnectivityService();
  }

  // @override
  // void dispose() {
  //   CheckInternet().listener.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: Provider<ConnectivityService>(
        create: (context) => new ConnectivityService(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserBloc(EmptyTasksState())),
            BlocProvider(create: (context) => UserBloc2(EmptyTasksState2()))
          ],
          // create: (context) {
          //   return UserBloc(EmptyTasksState());
          // },
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthProviderUser>(
                  create: (context) => AuthProviderUser()),
              ChangeNotifierProvider<UserProvider>(
                  create: (context) => UserProvider()),
            ],
            child: MaterialApp(
              localizationsDelegates: [
                // ... app-specific localization delegate[s] here
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''), // English, no country code
                const Locale('ar', ''), // Hebrew, no country code
                // Chinese *See Advanced Locales below*
                // ... other locales the app supports
              ],
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyApp2(widget.cou),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  int cou;
  MyApp2(this.cou);
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  void initState() {
    NotificationHandler().initialization();
    CheckInternet().checkConnection(context);
    //NotificationHandel().initi();
    SocketHandel().ini();
    // SocketHandel().listenToChannel("public", "notification", "PushNotification");
    //NotificationHandel().showNotification();
    super.initState();
  }

  @override
  void dispose() {
    CheckInternet().listener.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProviderUser>(context).setCountNotificationSp(widget.cou);
    return StreamProvider<ConnectivityStatus>.value(
      value: Provider.of<ConnectivityService>(context).valueStream,
      child: SplashScreen(),
    );
  }
}
