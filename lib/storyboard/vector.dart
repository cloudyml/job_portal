import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 760.7994384766;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // vectorg4m (6:600)
        width: double.infinity,
        height: 420.76 * fem,
        child: Image.asset(
          'assets/storyboard/images/vector.png',
          width: 760.8 * fem,
          height: 420.76 * fem,
        ),
      ),
    );
  }
}
