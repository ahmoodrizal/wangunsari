import 'package:flutter/material.dart';
import 'package:wangunsari/models/components/card_surat.dart';
import 'package:wangunsari/theme.dart';

class StatusSurat extends StatefulWidget {
  const StatusSurat({super.key});

  @override
  State<StatusSurat> createState() => _StatusSuratState();
}

class _StatusSuratState extends State<StatusSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Cek Status Surat',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultmargin),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CardSurat(
                  title: 'Surat Keterangan',
                  date: '10 Desember 2022',
                  status: 'SEDANG DIPROSES - DISETUJUI OLEH RT SETEMPAT',
                ),
                CardSurat(
                  title: 'Surat Keterangan Domisili',
                  date: '13 Desember 2022',
                  status: 'SEDANG DIPROSES - DISETUJUI OLEH KELURAHAN SILAHKAN AMBIL DI KANTOR DESA',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
