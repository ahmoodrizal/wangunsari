import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class LineDetail extends StatelessWidget {
  final String title;
  final String content;

  const LineDetail({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: darkTextStyle.copyWith(),
          ),
          Expanded(
            child: Text(
              content,
              style: darkTextStyle.copyWith(),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
