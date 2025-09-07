import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app_sprints/routes.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const ShoppingAppSprints());
}

class ShoppingAppSprints extends StatefulWidget {
  const ShoppingAppSprints({super.key});

  static _ShoppingAppSprintsState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ShoppingAppSprintsState>();
  }

  @override
  State<ShoppingAppSprints> createState() => _ShoppingAppSprintsState();
}

class _ShoppingAppSprintsState extends State<ShoppingAppSprints> {
  Locale _currentLocale = const Locale('en');

  void changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _currentLocale,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
