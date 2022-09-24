import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'User Profile Screen',
          style: darkTextStyle,
        ),
      ),
    );
  }
}
