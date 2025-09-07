import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animation.dart';


class AnimatedText extends StatelessWidget {
  final WelcomeAnimations animations;
  const AnimatedText({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animations.slideAnimation,
      child: const Text(
        "ShopEasy 🛒",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
