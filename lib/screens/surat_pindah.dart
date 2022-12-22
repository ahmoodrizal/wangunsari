import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:wangunsari/theme.dart';

class SuratPindah extends StatefulWidget {
  const SuratPindah({super.key});

  @override
  State<SuratPindah> createState() => _SuratPindahState();
}

class _SuratPindahState extends State<SuratPindah> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Halaman Surat Pindah',
          style: darkTextStyle,
        ),
      ),
    );
  }
}
