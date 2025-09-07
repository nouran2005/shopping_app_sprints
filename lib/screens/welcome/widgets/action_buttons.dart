import 'package:flutter/material.dart';
import 'package:shopping_app_sprints/generated/l10n.dart';
import 'package:shopping_app_sprints/screens/welcome/widgets/animation.dart';


class ActionButtons extends StatelessWidget {
  final WelcomeAnimations animations;
  const ActionButtons({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animations.slideAnimation,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              elevation: 5,
            ),
            onPressed: () => Navigator.pushNamed(context, '/signup'),
            child: Text(S.of(context).sign_up),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
            ),
            onPressed: () => Navigator.pushNamed(context, '/signin'),
            child:  Text(S.of(context).sign_in),
          ),
        ],
      ),
    );
  }
}
