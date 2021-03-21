import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textcontroller;
  final EdgeInsetsGeometry margin;
  final TextInputType keyboardType;

  final String text;

  CustomTextField({
    this.keyboardType,
    this.textcontroller,
    this.text,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 44,
      width: 253,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color(0x2027ae63),
            Color(0x4027ae93),
          ],
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.phone,
        inputFormatters: <TextInputFormatter>[],
        controller: textcontroller,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.white38,
          ),
          hintText: text,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white10,
            ),
          ),
        ),
      ),
    );
  }
}
