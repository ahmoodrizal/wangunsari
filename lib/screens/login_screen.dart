import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.goNamed('home'),
        child: Center(
          child: Text(
            'Login Screen',
            style: darkTextStyle,
          ),
        ),
      ),
    );
  }
}
