import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../model/home/listed_jobs_model.dart';

Widget jobsTabWithStream(HomeController controller) {
  return Padding(
    padding: EdgeInsets.only(top: 10.sp),
    child: StreamBuilder(
        stream: controller.streamJobs(),
        builder: (context, AsyncSnapshot<List<ListedJobsModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              child: Obx(() {
                controller.listOfJobs.assignAll(snapshot.data!);
                return Column(
                  children:
                      List.generate(controller.listOfJobs.length, (index) {
                    ListedJobsModel jobsModel = controller.listOfJobs[index];
                    return Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: Container(
                        height: Adaptive.h(25),
                        width: Adaptive.w(55),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          errorWidget: (context, url, dynamic) {
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
                                        Row(
                                          children: [
                                            Text("${jobsModel.job_domain} ",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "• ${jobsModel.number_of_openings} openings"),
                                          ],
                                        ),
                                        sizeBoxOf10,
                                        Text("${jobsModel.company_name}"),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("Posted by: ${jobsModel.posted_by}",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),

                            // sizeBoxOf10,
                            // RichTextView(
                            //     text: jobsModel.job_description!,
                            //     maxLines: 2,
                            //     viewLessText: "read less",
                            //     viewMoreText: "read more",
                            //     viewMoreLessStyle: TextStyle(color: mainColor),
                            //     supportedTypes: [BoldParser()],
                            //     truncate: true,
                            //     linkStyle: TextStyle(color: Colors.blue)),
                            // sizeBoxOf10,
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15.sp,
                                ),
                                horizontalSizeBoxOf10,
                                Text("${jobsModel.job_locaton}"),
                              ],
                            ),
                            Text(
                                "${timeago.format(jobsModel.posted_on!.toDate())}"),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            );
          }
        }),
  );
}
