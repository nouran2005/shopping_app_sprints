import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/main.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/action_buttons.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animated_logo.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animated_text.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late WelcomeAnimations _animations;

  @override
  void initState() {
    super.initState();
    _animations = WelcomeAnimations(this)..startAnimations();
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Colors.purple,
              Colors.deepPurpleAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.language,
                    color: Colors.white, size: 30),
                onPressed: () {
                  final current = Localizations.localeOf(context).languageCode;
                  final next =
                      current == 'en' ? const Locale('ar') : const Locale('en');
                  ShoppingAppSprints.of(context)?.changeLanguage(next);
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedLogo(animations: _animations),
                  const SizedBox(height: 40),
                  AnimatedText(animations: _animations),
                  const SizedBox(height: 40),
                  ActionButtons(animations: _animations),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
