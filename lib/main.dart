import 'package:explore_benin/pages/main_screen.dart';
import 'package:explore_benin/pages/signin_screen.dart';
import 'package:explore_benin/pages/signup_screen.dart';
import 'package:explore_benin/pages/welcome_screen.dart';
import 'package:explore_benin/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Définissez vos routes ici
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const WelcomeScreen(),
    '/inscription': (context) => const SignUpScreen(),
    '/connexion': (context) => const SignInScreen(),
    '/agenda': (context) => Container(),
    '/home': (context) => HomePage(),
    '/search': (context) => Container(),
    '/messaging': (context) => Container(),
    '/traduction': (context) => Container(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      routes: routes,
    );
  }
}
