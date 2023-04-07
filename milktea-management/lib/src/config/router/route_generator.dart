import 'package:flutter/material.dart';
import 'package:ltdidong2/src/config/common/custom_page_route.dart';
import 'package:ltdidong2/src/screens/Login/login.dart';
import 'package:ltdidong2/src/screens/cart/screens/cart_screen.dart';
import 'package:ltdidong2/src/screens/home/screens/home_page.dart';
import 'package:ltdidong2/src/screens/historyScreen.dart';
import 'package:ltdidong2/src/screens/order/order_detail_screen.dart';
import 'package:ltdidong2/src/screens/order/order_screen.dart';
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
      case '/login':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/login'),
          child: const LoginPage(),
        );
      case '/cart':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/cart'),
          child: const CartScreen(),
        );
      case '/orders':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/orders'),
          child: const OrderScreen(),
        );
      case '/orders/detail':
        return CustomPageRoute(
          settings: const RouteSettings(name: '/orders/detail'),
          child: const OrderDetailScreen(),
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
