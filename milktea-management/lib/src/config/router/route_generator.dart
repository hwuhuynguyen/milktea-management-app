import 'package:flutter/material.dart';
import 'package:ltdidong2/src/config/common/custom_page_route.dart';
import 'package:ltdidong2/src/screens/MainScreen.dart';
import 'package:ltdidong2/src/screens/historyScreen.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/add':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/'),
          child: const MainScreen(),
        );
      case '/':
        return CustomPageRoute(
          settings:
              RouteSettings(name: '/details', arguments: settings.arguments),
          child: const HistoryScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text("Not found")),
      );
    });
  }
}
