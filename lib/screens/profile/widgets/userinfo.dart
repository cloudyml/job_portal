import 'package:flutter/material.dart';

import '../../../utils/contants.dart';

Widget userInformationWidget(IconData icon, information) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.black54),
      horizontalSizeBoxOf10,
      Text(information),
    ],
  );
}
