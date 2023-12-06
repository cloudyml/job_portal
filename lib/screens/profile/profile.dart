import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/userinfo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors.dart';
import '../../utils/contants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.sp),
              child: Container(
                width: Adaptive.w(90),
                height: Adaptive.h(30),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: CircleAvatar(
                              minRadius: 10.sp,
                              maxRadius: 25.sp,
                              backgroundImage: CachedNetworkImageProvider(
                                  "https://yt3.googleusercontent.com/ytc/APkrFKaD-NB9fqXyazQ9xH3zzVExD2PBS5qrepR7POy6Xhw=s900-c-k-c0x00ffffff-no-rj"),
                            ),
                          ),
                          Positioned.fill(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              value: 0.80,
                              strokeWidth: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSizeBoxOf10,
                    horizontalSizeBoxOf10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizeBoxOf10,
                        Row(
                          children: [
                            Text("Dipen Pau",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: titleFontColor,
                                  fontFamily: "Semi-bold",
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            IconButton(
                                onPressed: () {},
                                splashRadius: 14.sp,
                                icon: Icon(Icons.edit))
                          ],
                        ),
                        Text("Flutter Developer",
                            style: TextStyle(
                              color: subtitleFontColor,
                              fontSize: 14.sp,
                            )),
                        Text("@ CloudyML",
                            style: TextStyle(
                              fontSize: 12.sp,
                            )),
                        SizedBox(width: Adaptive.w(35), child: Divider()),
                        SizedBox(
                          width: Adaptive.w(35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userInformationWidget(
                                      Icons.location_pin, "Gujarat, India"),
                                  userInformationWidget(
                                      Icons.cases_rounded, "2 years"),
                                  userInformationWidget(
                                      Icons.wallet, "3.6 LPA"),
                                ],
                              ),
                              SizedBox(height: 30.sp, child: VerticalDivider()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userInformationWidget(
                                      Icons.phone, "+917623969747"),
                                  userInformationWidget(
                                      Icons.email, "dipenpaun85@gmail.com"),
                                  userInformationWidget(
                                      Icons.calendar_month, "19, Dec 1996"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                      child: Container(
                        width: Adaptive.w(30),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft, //Starting point
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.purpleAccent,
                                Colors.blue,
                                Colors.white
                              ],
                              stops: [0.2, 0.5, 0.8],
                            ),
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        radius: 12.sp,
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                      horizontalSizeBoxOf10,
                                      Text(
                                        "Location Missing",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 20.sp,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.sp))),
                                  child: Text(
                                    "Add missing details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Container(
                    width: Adaptive.w(20),
                    height: Adaptive.h(100),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Container(
                    width: Adaptive.w(60),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.sp)),
                    height: Adaptive.h(100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
