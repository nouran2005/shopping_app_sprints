import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/screens/product%20details/product_details_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/signin/signin_screen.dart';
import 'screens/home/home_screen.dart';
import '../models/product.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case '/productDetails':
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null || args['product'] == null || args['product'] is! Product) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("❌ Product not found")),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: args['product']),
        );

      case '/home':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation);
            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found 🚫')),
          ),
        );
    }
  }
}
