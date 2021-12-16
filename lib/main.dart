import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

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
          title: 'Admin App',
          home: LoginScreen(),
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
