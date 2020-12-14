import 'package:flutter/material.dart';

class StoreCategoryClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height-50);
    path.quadraticBezierTo(
        size.width , size.height-45,
        size.width, size.height - 100)
    ;
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}