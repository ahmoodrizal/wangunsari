import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class CardSurat extends StatelessWidget {
  final String title;
  final String date;
  final String status;

  const CardSurat({
    super.key,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
            'Tanggal Pengajuan $date',
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
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: const Color.fromARGB(255, 231, 101, 101),
            ),
          ),
        ],
      ),
    );
  }
}
