import 'package:flutter/material.dart';
import 'package:wangunsari/components/detail_line.dart';
import 'package:wangunsari/theme.dart';

class ReviewSuratKelahiran extends StatelessWidget {
  const ReviewSuratKelahiran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Pengajuan Surat',
          style: whiteTextStyle,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultmargin),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Surat Kelahiran',
                style: darkTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 82, 165, 165),
                          ),
                          onPressed: () {
                            // print('surat diterima');
                          },
                          child: Text(
                            'Setujui Surat',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 206, 92, 92),
                          ),
                          onPressed: () {
                            // print('surat ditolak');
                          },
                          child: Text(
                            'Tolak Surat',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: defaultmargin,
              ),
              LineDetail(title: 'No Resi', content: '2023ABC92FKAXN'),
              LineDetail(title: 'Tanggal Pengajuan', content: '2023-01-03'),
              LineDetail(title: 'NIK Penduduk', content: '030210002100212'),
              LineDetail(title: 'Nama Penduduk', content: 'Kim Minju'),
            ],
          )
        ],
      ),
    );
  }
}
