import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/applied_jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/saved_jobs_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../utils/colors.dart';
import '../../utils/contants.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({
    super.key,
  });

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placement Portal"),
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active_rounded)),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.studentProfile);
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Row(
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
              child: Obx(() {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            minRadius: 10.sp,
                            maxRadius: 20.sp,
                            backgroundImage: const CachedNetworkImageProvider(
                                "https://yt3.googleusercontent.com/ytc/APkrFKaD-NB9fqXyazQ9xH3zzVExD2PBS5qrepR7POy6Xhw=s900-c-k-c0x00ffffff-no-rj"),
                          ),
                          const Positioned.fill(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              value: 0.95,
                              strokeWidth: 3,
                            ),
                          ),
                        ],
                      ),
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
                        style: const TextStyle(color: subtitleFontColor)),
                    homeController.currentCompany.isNotEmpty
                        ? Text("@ ${homeController.currentCompany.value}")
                        : const SizedBox(),
                    sizeBoxOf10,
                    Text(
                        "Last Updated ${timeago.format(homeController.profileUpdatedAt.value.toDate())}"),
                    sizeBoxOf10,
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.sp))),
                        child: const Text("Complete Profile"))
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: Container(
              width: Adaptive.w(60),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.sp)),
              height: Adaptive.h(100),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: const [
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
                      indicatorColor: Colors.purple,
                      labelColor: mainColor,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                      physics: const BouncingScrollPhysics(),
                      unselectedLabelStyle: const TextStyle(color: titleFontColor),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      jobsTabWithStream(homeController),
                      appliedJobsTab(),
                      savedJobsTab()
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
