import 'package:flutter/material.dart';
import 'package:ltdidong2/src/config/common/custom_page_route.dart';
import 'package:ltdidong2/src/screens/cart/screens/cart_screen.dart';
import 'package:ltdidong2/src/screens/home/screens/home_page.dart';
import 'package:ltdidong2/src/screens/historyScreen.dart';
import 'package:ltdidong2/src/screens/product/screens/product_detail_page.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/'),
          child: const HomePage(),
        );
      case '/detail':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/detail'),
          child: const ProductDetailPage(),
        );
      case '/cart':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/cart'),
          child: const CartScreen(),
        );
      case '/detail':
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
