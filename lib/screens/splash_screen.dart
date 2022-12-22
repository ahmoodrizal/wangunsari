import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wangunsari/services/user.dart';
import 'package:wangunsari/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _loadUserInfo() async {
    String token = await getToken();
    if (token == '') {
      // print('token not defined, redirect to login page');
      context.goNamed('login');
    } else {
      context.goNamed('home');
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _loadUserInfo();
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(defaultmargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Image.asset(
                  'assets/images/logomail.png',
                  width: 136,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sistem Informasi Surat Menyurat Desa Wangunsari',
                  style: darkTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc commodo congue arcu. Aenean commodo elit sit amet tellus tempor',
                      style: darkTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
