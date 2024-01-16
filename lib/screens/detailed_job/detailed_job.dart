import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../controllers/homescreen_controller/home_controller.dart';
import '../../utils/contants.dart';

class DetailedJobScreen extends StatefulWidget {
  DetailedJobScreen({super.key, this.index});

  final index;

  @override
  State<DetailedJobScreen> createState() => _DetailedJobScreenState();
}

class _DetailedJobScreenState extends State<DetailedJobScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getDetailedJob();
    super.initState();
  }

  List textButtonNames = [
    "Jobs",
    "Applied Jobs",
    "Saved Jobs",
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 600;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.15),
        body: homeController.listOfJobs.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: isPhone
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    topMenuBar(context, isPhone),
                    SizedBox(
                      height: 20.sp,
                    ),
                    isPhone
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: SizedBox(
                                width:
                                    isPhone ? Adaptive.w(50) : Adaptive.w(15),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios_new),
                                    Text("Go back to all jobs")
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.sp,
                            ),
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: SizedBox(
                                width:
                                    isPhone ? Adaptive.w(50) : Adaptive.w(15),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios_new),
                                    Text("Go back to all jobs")
                                  ],
                                ),
                              ),
                            ),
                          ),
                    sizeBoxOf10,
                    isPhone
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isPhone ? 20.sp : 35.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(15.sp)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 10.sp),
                              width: Adaptive.w(100),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        child: Container(
                                          height: 25.sp,
                                          width: 25.sp,
                                          child: CachedNetworkImage(
                                            errorWidget:
                                                (context, url, dynamic) {
                                              return Icon(Icons.error_outline);
                                            },
                                            imageUrl:
                                                "https://png.pngtree.com/png-vector/20190624/ourlarge/pngtree-cvjobjob-search-blue-icon-on-abstract-cloud-background-png-image_1492402.jpg",
                                            color: Colors.transparent,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                          ),
                                        ),
                                      ),
                                      horizontalSizeBoxOf10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${homeController.listOfJobs[int.parse(widget.index)].job_domain}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14.sp),
                                          ),
                                          Text(
                                            "${homeController.listOfJobs[int.parse(widget.index)].company_name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.75),
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.sp),
                                                  side: BorderSide(
                                                      color: Colors.black38,
                                                      width: 1)),
                                              backgroundColor: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.bookmark_added_rounded,
                                                  color: Colors.teal),
                                              horizontalSizeBoxOf10,
                                              Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.teal),
                                              ),
                                            ],
                                          )),
                                      horizontalSizeBoxOf10,
                                      SizedBox(
                                        width: 45.sp,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: mainColor),
                                            onPressed: () {},
                                            child: Text("Apply")),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(15.sp)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              width: Adaptive.w(100),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        child: Container(
                                          height: 25.sp,
                                          width: 25.sp,
                                          child: CachedNetworkImage(
                                            errorWidget:
                                                (context, url, dynamic) {
                                              return Icon(Icons.error_outline);
                                            },
                                            imageUrl:
                                                "https://png.pngtree.com/png-vector/20190624/ourlarge/pngtree-cvjobjob-search-blue-icon-on-abstract-cloud-background-png-image_1492402.jpg",
                                            color: Colors.transparent,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                          ),
                                        ),
                                      ),
                                      horizontalSizeBoxOf10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${homeController.listOfJobs[int.parse(widget.index)].job_domain}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14.sp),
                                          ),
                                          Text(
                                            "${homeController.listOfJobs[int.parse(widget.index)].company_name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.75),
                                                fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.sp),
                                                  side: BorderSide(
                                                      color: Colors.black38,
                                                      width: 1)),
                                              backgroundColor: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.bookmark_added_rounded,
                                                  color: Colors.teal),
                                              horizontalSizeBoxOf10,
                                              Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.teal),
                                              ),
                                            ],
                                          )),
                                      horizontalSizeBoxOf10,
                                      SizedBox(
                                        width: 45.sp,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: mainColor),
                                            onPressed: () {},
                                            child: Text("Apply")),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isPhone ? 20.sp : 35.sp, vertical: 10.sp),
                      child: Container(
                        width: Adaptive.w(100),
                        color: Colors.white,
                        padding: EdgeInsets.all(10.sp),
                        child: Text("Yet to be feched."),
                      ),
                    ),
                    isPhone
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                                child: Container(
                                  width: Adaptive.w(85),
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    children: [
                                      rowText(
                                          title: "Education",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .education),
                                      rowText(
                                          title: "Year of Passing",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .year_of_passing),
                                      rowText(
                                          title: "Eligibility",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .eligibility),
                                      rowText(
                                          title: "Job Role",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_domain),
                                      rowText(
                                          title: "Skill Sets",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .skill_set),
                                      rowText(
                                          title: "Description",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_description),
                                      rowText(
                                          title: "Job Location",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_location),
                                      rowText(
                                          title: "Streams",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .streams),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 35.sp, top: 10.sp, bottom: 10.sp),
                                child: Container(
                                  width: Adaptive.w(50),
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    children: [
                                      rowText(
                                          title: "Education",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .education),
                                      rowText(
                                          title: "Year of Passing",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .year_of_passing),
                                      rowText(
                                          title: "Eligibility",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .eligibility),
                                      rowText(
                                          title: "Job Role",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_domain),
                                      rowText(
                                          title: "Skill Sets",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .skill_set),
                                      rowText(
                                          title: "Description",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_description),
                                      rowText(
                                          title: "Job Location",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_location),
                                      rowText(
                                          title: "Streams",
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .streams),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp,
                                    right: 35.sp,
                                    top: 10.sp,
                                    bottom: 10.sp),
                                child: Container(
                                  width: Adaptive.w(24),
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Overview",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                      sizeBoxOf10,
                                      overviewRowText(
                                          iconData: Icons.location_pin,
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .job_location),
                                      overviewRowText(
                                          iconData: Icons.cases_sharp,
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .required_exp),
                                      overviewRowText(
                                          iconData: Icons.stacked_bar_chart,
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .offered_salary),
                                      overviewRowText(
                                          iconData: Icons.credit_card,
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .interview_type),
                                      overviewRowText(
                                          iconData: Icons.person,
                                          value: homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .number_students_applied
                                              .toString()),
                                      overviewRowText(
                                          iconData: Icons.lock_clock,
                                          value: timeago.format(homeController
                                              .listOfJobs[
                                                  int.parse(widget.index)]
                                              .posted_on!
                                              .toDate())),
                                      // overviewRowText(
                                      //     iconData: Icons.menu_book_sharp,
                                      //     value: "Skill Set"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      );
    });
  }

  Widget rowText({String? title, String? value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(title != null ? title : "Title"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Text(":"),
          ),
          SizedBox(
              width: Adaptive.w(33),
              child: SelectableText(
                value != null ? value : "Civil Engineer",
              )),
        ],
      ),
    );
  }

  Widget overviewRowText({IconData? iconData, String? value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData != null ? iconData : Icons.add,
            size: 15.sp,
            color: Colors.teal,
          ),
          horizontalSizeBoxOf10,
          SizedBox(
              width: Adaptive.w(12),
              child: SelectableText(
                value != null ? value : "Subtitle",
                style: TextStyle(color: Colors.grey),
              )),
        ],
      ),
    );
  }
}
