import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.goNamed('login'),
        child: Center(
          child: Text(
            'Splash Screen',
            style: darkTextStyle,
          ),
        ),
      ),
    );
  }
}
