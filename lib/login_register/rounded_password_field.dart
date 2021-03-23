import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Your Password",
          icon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.red.shade400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
