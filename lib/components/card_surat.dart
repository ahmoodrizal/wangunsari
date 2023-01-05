import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';
import 'package:go_router/go_router.dart';

class CardSurat extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String resi;
  final String id;

  const CardSurat({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.resi,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('detail-surat', params: {'id': id}),
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
