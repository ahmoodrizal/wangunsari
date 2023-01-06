import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class EditSuratDomisili extends StatelessWidget {
  final String id;
  const EditSuratDomisili({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Surat Domisili',
          style: whiteTextStyle,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Edit Surat Domisili',
          style: darkTextStyle,
        ),
      ),
    );
  }
}
