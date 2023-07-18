import 'package:flutter/material.dart';

import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';

class CustomTextfieldPara extends StatelessWidget {
  final TextEditingController controller;
  final String? label, hint;

  CustomTextfieldPara({required this.controller, this.label, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 100,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.grey,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(width: 1, color: kBlack)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(width: 1, color: kBlack)),
          contentPadding: const EdgeInsets.all(13.0),
          labelText: label,
          labelStyle: Palette.labelStyle,
          hintText: hint,
          hintStyle: Palette.hintStyle),
    );
  }
}
