import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  MyClipper(this.isDark);
  final bool isDark;
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(0, size.height * 0.75, 0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * (isDark ? 0.40 : 0.50),
        size.height * (isDark ? 0.60 : 0.55),
        size.width,
        (isDark ? 0.67 : 0.60) * size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
