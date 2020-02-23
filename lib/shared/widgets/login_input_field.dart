import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  const LoginInputField(
      {Key key,
      this.isPassword = false,
      @required this.labelText,
      this.controller})
      : super(key: key);
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText ?? '-',
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[700])),
        ),
      ),
    );
  }
}
