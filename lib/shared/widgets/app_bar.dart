import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const AppBarCustom({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFF208286),
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Image.asset(
              "assets/images/logo.png",
              height: 30,
            ),
          ),
          SizedBox(width: 5,),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}