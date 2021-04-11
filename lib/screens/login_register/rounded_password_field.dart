import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({required this.onChanged, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: Colors.red.shade400,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
