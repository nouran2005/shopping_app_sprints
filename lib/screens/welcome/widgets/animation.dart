import 'package:flutter/material.dart';

class WelcomeAnimations {
  late AnimationController logoController;
  late AnimationController textController;
  late AnimationController glowController;

  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> glowAnimation;

  final TickerProvider vsync;

  WelcomeAnimations(this.vsync) {
    logoController = AnimationController(vsync: vsync, duration: const Duration(seconds: 2));
    scaleAnimation = CurvedAnimation(parent: logoController, curve: Curves.elasticOut);
    fadeAnimation = CurvedAnimation(parent: logoController, curve: Curves.easeIn);

    textController = AnimationController(vsync: vsync, duration: const Duration(seconds: 1));
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: textController, curve: Curves.easeOut));

    glowController = AnimationController(vsync: vsync, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    glowAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: glowController, curve: Curves.easeInOut),
    );
  }

  void startAnimations() {
    logoController.forward().then((_) => textController.forward());
  }

  void dispose() {
    logoController.dispose();
    textController.dispose();
    glowController.dispose();
  }
}
