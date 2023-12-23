import 'package:flutter/material.dart';
import 'package:suitmedia_test/constants/global_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GlobalTextStyle.titleH3,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(12)),
        ));
  }
}
