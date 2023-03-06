import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class CardSuratAdminRT extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String resi;
  final String name;
  final String nik;
  final String tipe;
  final String id;

  const CardSuratAdminRT({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.resi,
    required this.id,
    required this.name,
    required this.tipe,
    required this.nik,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'SURAT KETERANGAN':
            context.goNamed('review-rt-surat-keterangan', params: {'id': id, 'tipe': tipe});
            // print('review surat keterangan');
            break;
          case 'SURAT DOMISILI':
            context.goNamed('review-rt-surat-domisili', params: {'id': id, 'tipe': tipe});
            // print('review surat domisili');
            break;
          case 'SURAT KELAHIRAN':
            context.goNamed('review-rt-surat-kelahiran', params: {'id': id, 'tipe': tipe});
            // print('review surat kelahiran');
            break;
          case 'SURAT NIKAH':
            context.goNamed('review-rt-surat-nikah', params: {'id': id, 'tipe': tipe});
            // print('review surat nikah');
            break;
          default:
          // print('review surat keterangan');
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: defaultmargin),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(255, 225, 216, 241),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: darkTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              date,
              style: darkTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'No Resi - $resi',
              style: darkTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Nama Penduduk - $name',
              style: darkTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'NIK - $nik',
              style: darkTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              status,
              textAlign: TextAlign.justify,
              style: darkTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 216, 88, 88),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
