import 'package:drug_addiction/ui/screens/dashboard_screen.dart';
import 'package:drug_addiction/ui/screens/login/login_screen.dart';
import 'package:drug_addiction/ui/screens/record_screen.dart';
import 'package:drug_addiction/ui/screens/result_screen.dart';
import 'package:drug_addiction/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Rooter {
  static Route<dynamic> generateRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case 'record':
        return MaterialPageRoute(builder: (_) => RecordScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'resuldScreen':
        return MaterialPageRoute(
            builder: (_) => ResultScreen(
                  result: '',
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route available ${sitting.name}"),
                  ),
                ));
    }
  }
}
