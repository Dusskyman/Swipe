import 'package:flutter/material.dart';

class MainAppBar extends PreferredSize {
  final String title;
  final Color backgroundcolor;
  final VoidCallback onTap;
  final VoidCallback onPress;

  MainAppBar({
    this.title,
    this.backgroundcolor,
    this.onTap,
    this.onPress,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => onTap(),
          ),
          backgroundColor: backgroundcolor ?? Colors.grey[300],
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () => onPress(),
            ),
          ],
        ),
      ),
    );
  }
}
