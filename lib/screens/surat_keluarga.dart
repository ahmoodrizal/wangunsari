import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:wangunsari/theme.dart';

class SuratKeluarga extends StatefulWidget {
  const SuratKeluarga({super.key});

  @override
  State<SuratKeluarga> createState() => _SuratKeluargaState();
}

class _SuratKeluargaState extends State<SuratKeluarga> {
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
          'Halaman Surat Keluarga',
          style: darkTextStyle,
        ),
      ),
    );
  }
}
