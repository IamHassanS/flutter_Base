import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
   var path = Path();
   path.lineTo(0, size.height);
   var initialStartOffset = Offset(0, size.height - 20);
   var initialEndOffset = Offset(30, size.height - 20);

   path.quadraticBezierTo(initialStartOffset.dx, initialStartOffset.dy, initialEndOffset.dx, initialEndOffset.dy);

   var midStartOffset = Offset(30, size.height - 20);
   var midEndOffset = Offset(size.width - 30, size.height - 20);

   path.quadraticBezierTo(midStartOffset.dx, midStartOffset.dy, midEndOffset.dx, midEndOffset.dy);


   var finalStartOffset = Offset(size.width, size.height - 20);
   var finalEndOffset = Offset(size.width, size.height);

   path.quadraticBezierTo(finalStartOffset.dx, finalStartOffset.dy, finalEndOffset.dx, finalEndOffset.dy);

   path.lineTo(size.width, 0);
   path.close();
   return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}