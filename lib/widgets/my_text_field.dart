import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.showText,
  });

  final Function(String)? onChanged;
  final String hintText;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: showText,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryLightColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kDarkBlue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
