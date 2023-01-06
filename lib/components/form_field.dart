import 'package:flutter/material.dart';
import 'package:wangunsari/theme.dart';

class MailFormField extends StatelessWidget {
  final String title;
  final TextInputType type;
  final TextEditingController controller;

  const MailFormField({super.key, required this.title, required this.type, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: controller.value == '' ? false : true,
          controller: controller,
          validator: (value) => value!.isEmpty ? '$title tidak boleh kosong' : null,
          keyboardType: type,
          style: darkTextStyle.copyWith(
            fontSize: 16,
          ),
          showCursor: false,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            label: Text(
              title,
              style: darkTextStyle.copyWith(
                color: greyColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
