import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/edit_paket_screen.dart';
import 'screens/login_screen.dart';
import 'screens/paket_overview_screen.dart';
import 'screens/register_screen.dart';
import 'providers/pakets.dart';
import 'providers/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pakets(),
        ),
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Admin App',
        home: const LoginScreen(),
        themeMode: ThemeMode.light,
        routes: {
          EditPaketScreen.routeName: (ctx) => EditPaketScreen(),
          PaketOverviewScreen.routeName: (ctx) => const PaketOverviewScreen(),
          RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
