import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/profile/profile_controller.dart';
import 'package:job_portal_cloudyml/controllers/student_login/login.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/dialog_namechange.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/quicklinks.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/student_resume_section.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/userinfo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/homescreen_controller/home_controller.dart';
import '../../controllers/student_login/signup.dart';
import '../../utils/colors.dart';
import '../../utils/contants.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final loginController = Get.put(LoginController());
  final homeController = Get.put(HomeController());
  final profileController = Get.put(ProfileController());
  final signUpController = Get.put(SignupController());
  RxBool isHovered = false.obs;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 600;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topMenuBar(context, isPhone),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            profileController.pickProfilePicture();
                          },
                          onHover: (value) {
                            isHovered.value = value;
                          },
                          borderRadius: BorderRadius.circular(30.sp),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.sp),
                            child: Obx(() {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Obx(() {
                                      return CircleAvatar(
                                        minRadius: 10.sp,
                                        maxRadius: 25.sp,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                homeController
                                                    .profile_picture.value),
                                      );
                                    }),
                                  ),
                                  Positioned.fill(
                                    child: Obx(() {
                                      return CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.teal),
                                        value: homeController
                                            .completionPercentage.value
                                            .toPrecision(2)
                                            .toDouble(),
                                        strokeWidth: 6,
                                      );
                                    }),
                                  ),
                                  isHovered.value
                                      ? Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: CircleAvatar(
                                            minRadius: 10.sp,
                                            maxRadius: 25.sp,
                                            backgroundColor: Colors.black38,
                                            child: Text(
                                              "Change Profile Picture",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp),
                                            ),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              );
                            }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: Container(
                            padding: EdgeInsets.all(7.sp),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Text(
                              "${homeController.completionPercentage.value.toPrecision(2).toDouble() * 100}%",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
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
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  splashRadius: 14.sp,
                                  icon: Icon(Icons.edit))
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
                                  onPressed: () {
                                    dialogToAddCompanyName(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.add),
                                      Text("Add current company"),
                                    ],
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
                                        Icons.location_pin,
                                        homeController.residence.isNotEmpty
                                            ? homeController.residence
                                                .toString()
                                            : "Unknown"),
                                    userInformationWidget(
                                        Icons.cases_rounded,
                                        homeController
                                                .years_of_experience.isNotEmpty
                                            ? homeController.years_of_experience
                                                .toString()
                                            : "0 years"),
                                    userInformationWidget(
                                        Icons.wallet,
                                        homeController.userSalary.isNotEmpty
                                            ? homeController.userSalary.value
                                            : "yet to start"),
                                  ],
                                ),
                                SizedBox(
                                    height: 30.sp, child: VerticalDivider()),
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
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft, //Starting point
                              end: Alignment.centerRight,
                              colors: [
                                Colors.teal.withOpacity(0.7),
                                Colors.teal.withOpacity(0.5),
                                Colors.teal.withOpacity(0.35)
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
                                      backgroundColor: Colors.transparent,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Container(
                    width: Adaptive.w(20),
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: quickLinksWidget(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      commonContainer(
                          child: studentResumeSection(
                              homeController, signUpController),
                          topPadding: 10.sp),
                      commonContainer(
                          child: resumeHeadline(homeController, context)),
                      commonContainer(
                          child: keySkills(homeController, context)),
                      commonContainer(
                          child: employmentSection(context), topPadding: 10.sp),
                      commonContainer(
                          child: educationSection(context), topPadding: 10.sp),
                      commonContainer(
                          child:
                              profileSummarySection(context, profileController),
                          topPadding: 10.sp),
                      commonContainer(
                          child: languageProficiency(), topPadding: 10.sp)
                    ],
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
