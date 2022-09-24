import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.goNamed('profile'),
        child: Center(
          child: Text(
            'Home Screen',
            style: darkTextStyle,
          ),
        ),
      ),
    );
  }
}
