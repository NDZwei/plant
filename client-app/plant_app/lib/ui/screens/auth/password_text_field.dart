
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  const PasswordTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: _obscureText,
      hintText: widget.hintText,
      icon: Icons.lock,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
