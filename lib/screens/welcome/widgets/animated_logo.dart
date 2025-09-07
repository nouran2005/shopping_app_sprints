import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animation.dart';


class AnimatedLogo extends StatelessWidget {
  final WelcomeAnimations animations;
  const AnimatedLogo({super.key, required this.animations});

  Widget _buildAnimatedImage(String imagePath, {bool isNetwork = false}) {
    return AnimatedBuilder(
      animation: animations.glowAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: 0.05 * animations.glowController.value,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withAlpha(153),
                  blurRadius: animations.glowAnimation.value,
                  spreadRadius: animations.glowAnimation.value / 2,
                ),
              ],
            ),
            child: ClipOval(
              child: isNetwork
                  ? Image.network(imagePath, width: 120, height: 120, fit: BoxFit.cover)
                  : Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animations.scaleAnimation,
      child: FadeTransition(
        opacity: animations.fadeAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo1",
              child: _buildAnimatedImage("assets/images/products.jpg"),
            ),
            const SizedBox(width: 30),
            Hero(
              tag: "logo2",
              child: _buildAnimatedImage(
                "https://m.media-amazon.com/images/I/51xuEUkeKRL._UF1000,1000_QL80_.jpg",
                isNetwork: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
