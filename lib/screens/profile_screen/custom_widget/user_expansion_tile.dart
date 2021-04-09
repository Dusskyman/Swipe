import 'package:flutter/material.dart';

class UserExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  UserExpansionTile({
    this.title,
    this.children,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey[200],
          width: 2.0,
        ),
      ),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        title: Text(title),
        children: children,
      ),
    );
  }
}
