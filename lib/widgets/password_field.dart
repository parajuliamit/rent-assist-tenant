import 'package:flutter/material.dart';
import 'package:tenant_app/constants.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(this.label, {required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_isVisible,
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.key_outlined,
          color: blueColor,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        labelText: widget.label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
