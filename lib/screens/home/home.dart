import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/applied_jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/jobs_tab.dart';
import 'package:job_portal_cloudyml/screens/home/widgets/saved_jobs_tab.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/colors.dart';
import '../../utils/contants.dart';
import '../profile/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placement Portal"),
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_rounded)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.person)),
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
              child: Column(
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
                        Positioned.fill(
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
                  Text("Dipen Pau",
                      style: TextStyle(
                        color: titleFontColor,
                        fontFamily: "Semi-bold",
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Text("Flutter Developer",
                      style: TextStyle(color: subtitleFontColor)),
                  Text("@ CloudyML"),
                  sizeBoxOf10,
                  Text("Last Updated 1m ago"),
                  sizeBoxOf10,
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.sp))),
                      child: Text("Complete Profile"))
                ],
              ),
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
                      labelColor: mainColor,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                      physics: BouncingScrollPhysics(),
                      unselectedLabelStyle: TextStyle(color: titleFontColor),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      jobsTab(),
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