import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'screens/add_screen.dart';
import 'screens/login_screen.dart';
import 'screens/paket_detail_screen.dart';
import 'screens/paket_overview_screen.dart';
import 'providers/pakets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pakets(),
        ),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
          ),
          title: 'Admin App',
          home: LoginScreen(),
          themeMode: ThemeMode.light,
          routes: {
            AddScreen.routeName: (ctx) => AddScreen(),
            PaketOverviewScreen.routeName: (ctx) => PaketOverviewScreen(),
            PaketDetailScreen.routeName: (ctx) => PaketDetailScreen(),
          },
          onGenerateRoute: (settings) {
            print(settings.arguments);
            return MaterialPageRoute(
              builder: (ctx) => LoginScreen(),
            );
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => LoginScreen(),
            );
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
