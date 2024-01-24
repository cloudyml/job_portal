import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/controllers/profile/profile_controller.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/applied_jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/saved_jobs_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/contants.dart';

class StudentHomeScreen extends StatefulWidget {
  StudentHomeScreen({
    super.key,
  });

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final homeController = Get.put(HomeController());
  final profileController = Get.put(ProfileController());
  RxBool isHovered = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 600;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          topMenuBar(context, isPhone),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isPhone
                    ? SizedBox()
                    : homeController.loggedIN.value
                        ? Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Container(
                              width: Adaptive.w(20),
                              height: Adaptive.h(50),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Obx(() {
                                return Column(
                                  children: [
                                    sizeBoxOf10,
                                    InkWell(
                                      borderRadius:
                                          BorderRadius.circular(25.sp),
                                      onTap: () {
                                        profileController.pickProfilePicture();
                                      },
                                      onHover: (value) {
                                        isHovered.value = value;
                                      },
                                      child: Obx(() {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10.sp),
                                              child: Obx(() {
                                                return CircleAvatar(
                                                  minRadius: 10.sp,
                                                  maxRadius: 20.sp,
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          homeController
                                                              .profile_picture
                                                              .value),
                                                );
                                              }),
                                            ),
                                            Positioned.fill(
                                              child: Obx(() {
                                                return CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(Colors.teal),
                                                  value: homeController
                                                      .completionPercentage
                                                      .value
                                                      .toPrecision(2)
                                                      .toDouble(),
                                                  strokeWidth: 7.sp,
                                                );
                                              }),
                                            ),
                                            isHovered.value
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.all(10.sp),
                                                    child: CircleAvatar(
                                                      minRadius: 10.sp,
                                                      maxRadius: 20.sp,
                                                      backgroundColor:
                                                          Colors.black45,
                                                      child: Text(
                                                        "Change Profile Picture",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.sp),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox()
                                          ],
                                        );
                                      }),
                                    ),
                                    sizeBoxOf10,
                                    Text(homeController.userName.value,
                                        style: const TextStyle(
                                          color: titleFontColor,
                                          fontFamily: "Semi-bold",
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Text(homeController.userDomain.value,
                                        style: TextStyle(
                                            color: subtitleFontColor)),
                                    homeController.currentCompany.isNotEmpty
                                        ? Text(
                                            "@ ${homeController.currentCompany.value}")
                                        : SizedBox(),
                                    sizeBoxOf10,
                                    Text(
                                        "Last Updated ${timeago.format(homeController.profileUpdatedAt.value.toDate())}"),
                                    sizeBoxOf10,
                                    ElevatedButton(
                                        onPressed: () {
                                          GoRouter.of(context)
                                              .push(AppRoutes.studentProfile);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.sp)),
                                            backgroundColor: Colors.teal),
                                        child: Text("View Profile"))
                                  ],
                                );
                              }),
                            ),
                          )
                        : SizedBox(),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Container(
                    width: isPhone ? Adaptive.w(90) : Adaptive.w(60),
                    height: isPhone ? Adaptive.h(90) : Adaptive.h(85),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Obx(() {
                      return DefaultTabController(
                        length: homeController.loggedIN.value ? 3 : 1,
                        child: homeController.loggedIN.value
                            ? Column(
                                children: [
                                  TabBar(
                                    tabs: [
                                      Tab(
                                        text: "Jobs",
                                      ),
                                      Tab(
                                        text: "Applied Jobs",
                                      ),
                                      Tab(
                                        text: "Saved Jobs",
                                      )
                                    ],
                                    indicatorColor: mainColor,
                                    labelColor: mainColor,
                                    unselectedLabelColor: Colors.grey,
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                    physics: BouncingScrollPhysics(),
                                    unselectedLabelStyle:
                                        TextStyle(color: titleFontColor),
                                  ),
                                  Expanded(
                                      child: TabBarView(children: [
                                    jobsTabWithStream(isPhone),
                                    appliedJobsTab(),
                                    savedJobsTab()
                                  ])),
                                ],
                              )
                            : Column(
                                children: [
                                  TabBar(
                                    tabs: [
                                      Tab(
                                        text: "Jobs",
                                      ),
                                    ],
                                    indicatorColor: mainColor,
                                    labelColor: mainColor,
                                    unselectedLabelColor: Colors.grey,
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                    physics: BouncingScrollPhysics(),
                                    unselectedLabelStyle:
                                        TextStyle(color: titleFontColor),
                                  ),
                                  Expanded(
                                      child: TabBarView(children: [
                                    jobsTabWithStream(isPhone),
                                  ])),
                                ],
                              ),
                      );
                    }),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
