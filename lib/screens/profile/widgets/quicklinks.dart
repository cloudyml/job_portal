import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget quickLinksWidget(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SelectableText(
        "Quick links",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      sizeBoxOf10,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(nameOfLinks.length, (index) {
          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.sp),
            hoverColor: Colors.teal,
            child: SizedBox(
              height: 20.sp,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    Text(
                      nameOfLinks[index],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      )
    ],
  );
}

List nameOfLinks = [
  "Resume",
  "Resume headline",
  "Key skills",
  "Employment",
  "Education",
  "IT skills",
  "Projects",
  "Profile Summary",
  "Accomplishments",
  "Career profile",
  "Personal details"
];
