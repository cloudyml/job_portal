import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 760.7994384766;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
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
