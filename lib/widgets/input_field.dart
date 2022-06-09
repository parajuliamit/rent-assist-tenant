import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;

  const InputField(this.label, this.icon,
      {this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      textInputAction: textInputAction,
      controller: controller,
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: icon,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      ),
    );
  }
}
