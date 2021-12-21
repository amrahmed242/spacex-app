import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import '../core/config/app_settings.config.dart';
import '../core/utils/provider_setup.dart';
import '../ui/pages/splash_screen.dart';
import '../ui/routes/routes.dart';
import '../ui/styles/app_theme.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(context),
      child: MaterialApp(
        theme: AppTheme.mainTheme,
        routes: Routes.getAppRoutes(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

Future<void> initServices() async {
  //for web url bugs
  setPathUrlStrategy();

  //init global gonfig data
  GlobalConfiguration().loadFromMap(appSettings);
}
