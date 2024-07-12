import 'package:flutter/material.dart';
import 'package:todo/features/onboarding/presentation/view/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnBoardingBody(),
      ),
    );
  }
}
