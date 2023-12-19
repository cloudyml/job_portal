import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/student_login/login.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/userinfo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/homescreen_controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/contants.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final loginController = Get.put(LoginController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.studentHome);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                loginController.logout(context);
              },
              icon: const Icon(Icons.power_settings_new_sharp)),
        ],
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
                              backgroundImage: const CachedNetworkImageProvider(
                                  "https://yt3.googleusercontent.com/ytc/APkrFKaD-NB9fqXyazQ9xH3zzVExD2PBS5qrepR7POy6Xhw=s900-c-k-c0x00ffffff-no-rj"),
                            ),
                          ),
                          const Positioned.fill(
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
                    Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeBoxOf10,
                          Row(
                            children: [
                              Text(homeController.userName.value,
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
                                  icon: const Icon(Icons.edit))
                            ],
                          ),
                          Text(homeController.userDomain.value,
                              style: TextStyle(
                                color: subtitleFontColor,
                                fontSize: 14.sp,
                              )),
                          homeController.currentCompany.isNotEmpty
                              ? Text("@ CloudyML",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ))
                              : TextButton(
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.add),
                                      Text("Add current company"),
                                    ],
                                  )),
                          SizedBox(width: Adaptive.w(35), child: const Divider()),
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
                                        Icons.cases_rounded,
                                        homeController.currentCompany.isNotEmpty
                                            ? "2 years"
                                            : "0 years"),
                                    userInformationWidget(
                                        Icons.wallet,
                                        homeController.currentCompany.isNotEmpty
                                            ? homeController.userSalary.value
                                            : "yet to start"),
                                  ],
                                ),
                                SizedBox(
                                    height: 30.sp, child: const VerticalDivider()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    userInformationWidget(Icons.phone,
                                        homeController.userMobileNumber.value),
                                    userInformationWidget(Icons.email,
                                        homeController.userEmail.value),
                                    userInformationWidget(
                                        Icons.calendar_month, "19, Dec 1996"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                      child: Container(
                        width: Adaptive.w(30),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
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
                                        radius: 12.sp,
                                        backgroundColor: Colors.deepPurple,
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
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
                    child: const Column(
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
