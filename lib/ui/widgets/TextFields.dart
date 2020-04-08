import 'package:flutter/material.dart';
import 'package:fresh_food/constants/app_constants.dart';

import '../../utils/styles.dart';

class TextFieldOne extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final AssetImage prefixIconImage;

  const TextFieldOne({
    Key key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.prefixIconImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: bodyDarkText,
      controller: controller,
      cursorColor: green,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: lighterGrey,
        filled: true,
        hintStyle: bodyLightText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
        prefixIcon: ImageIcon(
          prefixIconImage,
          color: bodyLightText.color,
        ),
      ),
    );
  }
}
