import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bachgroundColor;
  final Color iconcolor;
  final double size;
  final double iconSize;
  const AppIcon({Key? key,
    required this.icon,
     this.bachgroundColor=const Color(0xFFfcf4e4),
     this.iconcolor= Colors.black,
     this.size=40,
  this.iconSize=16,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bachgroundColor,
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconSize,
      ),
    );
  }
}
