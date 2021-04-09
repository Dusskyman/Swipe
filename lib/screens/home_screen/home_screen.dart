import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pj/global/custom_widgets/backgrounds/swipe_logo.dart';
import 'package:flutter_test_pj/global/style/gradients.dart';
import 'package:flutter_test_pj/screens/profile_screen/profile_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text('Swipe'),
        backgroundColor: Colors.white,
      ),
      drawerEdgeDragWidth: 20,
      drawer: Container(
        alignment: Alignment.topCenter,
        width: 280,
        padding: EdgeInsets.fromLTRB(
          20,
          Size.fromHeight(kToolbarHeight).height,
          20,
          0,
        ),
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SwipeLogo(
                  height: 30,
                  width: 40,
                ),
                IconButton(
                    icon: Icon(
                      CupertinoIcons.gear,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage())))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
