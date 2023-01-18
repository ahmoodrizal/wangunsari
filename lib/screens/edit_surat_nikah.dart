import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class EditSuratNikah extends StatefulWidget {
  final String suratId;
  const EditSuratNikah({super.key, required this.suratId});

  @override
  State<EditSuratNikah> createState() => _EditSuratNikahState();
}

class _EditSuratNikahState extends State<EditSuratNikah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Surat Nikah',
          style: whiteTextStyle,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Edit Surat Nikah',
          style: darkTextStyle,
        ),
      ),
    );
  }
}
