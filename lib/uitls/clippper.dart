import 'package:flutter/material.dart';

class CustomClipperForAppBar extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
path.lineTo(0, 0);
path.lineTo(0, 50);
path.quadraticBezierTo( -3, 85,50, 85);
path.lineTo(size.width-40,85);
path.lineTo(size.width, 85);
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
