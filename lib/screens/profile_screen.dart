import 'package:flutter/material.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'UserProfileView',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            logout().then((value) => context.goNamed('login'));
          },
          child: Text(
            'LOGOUT',
            style: darkTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
