import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xffFFF3CD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffFFEEBA),
        ),
      ),
      child: Text(
        'Perhatian!\nPengajuan surat membutuhkan persetujuan RT, RW dan Pihak Kelurahan setempat, silahkan hubungi admin apabila 5x24 belum mendaptkan persetujuan.',
        style: yellowTextStyle.copyWith(
          fontSize: 12,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
