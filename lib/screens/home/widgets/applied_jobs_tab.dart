import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget appliedJobsTab() {
  return Padding(
    padding: EdgeInsets.only(top: 10.sp),
    child: SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Padding(
            padding: EdgeInsets.all(5.sp),
            child: Container(
              height: Adaptive.h(15),
              width: Adaptive.w(55),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Center(child: Text("Applied Jobs ${index + 1}")),
            ),
          );
        }),
      ),
    ),
  );
}
