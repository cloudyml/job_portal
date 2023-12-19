import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/firebase_options.dart';
import 'package:job_portal_cloudyml/routes/go_router.dart';
import 'package:job_portal_cloudyml/routes/login_state_check.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/googlecontroller.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  Get.put(GoogleController());
  setPathUrlStrategy();
  final state = LoginState(await SharedPreferences.getInstance());
  state.checkLoggedIn();
  runApp(MyApp(
    loginState: state,
  ));
}

class MyApp extends StatelessWidget {
  final LoginState loginState;

  const MyApp({super.key, required this.loginState});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginState(loginState.prefs),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginState>(
            lazy: false,
            create: (BuildContext createContext) => loginState,
          ),
          Provider<MyRouter>(
            lazy: false,
            create: (BuildContext createContext) => MyRouter(loginState),
          ),
        ],
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          final router = Provider.of<MyRouter>(context, listen: false).routes;
          return GetMaterialApp.router(
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                // primaryColor: Colors.deepPurple,
                colorSchemeSeed: Colors.deepPurple),
          );
        }),
      ),
    );
  }
}
