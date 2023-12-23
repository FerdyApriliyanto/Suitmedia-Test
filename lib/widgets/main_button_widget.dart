import 'package:flutter/material.dart';
import 'package:suitmedia_test/constants/global_color.dart';
import 'package:suitmedia_test/constants/global_text_style.dart';

class MainButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const MainButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: GlobalColor.main),
      child: Text(
        text,
        style: GlobalTextStyle.buttonText,
      ),
    );
  }
}
