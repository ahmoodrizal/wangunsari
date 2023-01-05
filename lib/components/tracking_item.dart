import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class TrackingItem extends StatelessWidget {
  final String date;
  final String status;
  final String content;

  const TrackingItem({super.key, required this.date, required this.content, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: status == 'DIBATALKAN' ? Color.fromARGB(255, 206, 92, 92) : primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 3,
              height: 60,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: darkTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$status - $content',
                style: darkTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
