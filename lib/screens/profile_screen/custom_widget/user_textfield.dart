import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final String title;
  final String hintText;
  final bool readOnly;

  UserTextField({this.title, this.hintText, this.readOnly, this.onSubmitted});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          height: 44,
          child: TextFormField(
            onFieldSubmitted: onSubmitted,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
