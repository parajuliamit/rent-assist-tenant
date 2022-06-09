import 'package:flutter/material.dart';
import 'package:tenant_app/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String text;
  final Color fillColor;
  final Color textColor;

  const CustomButton(this.text, this.onpress, this.fillColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: blueColor)),
      onPressed: onpress,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 17),
          ),
        ),
      ),
      color: fillColor,
      elevation: 0,
    );
  }
}
