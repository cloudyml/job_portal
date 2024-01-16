import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_cloudyml/controllers/apply_now_slider/apply_now.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/routes/app_routes.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../model/home/listed_jobs_model.dart';

Widget jobsTabWithStream(isPhone) {
  final controller = Get.put(HomeController());
  final applyNowController = Get.put(ApplyNowController());
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
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   // Your state-modifying code here
            //
            // });
            controller.listOfJobs.assignAll(snapshot.data!);
            return SingleChildScrollView(
              child: Column(
                children: List.generate(controller.listOfJobs.length, (index) {
                  ListedJobsModel jobsModel = controller.listOfJobs[index];

                  List<ListedJobsModel> listOfJobs = controller.listOfJobs;
                  List<Map<String, dynamic>> listOfJobsAsMap =
                      listOfJobs.map((job) => job.toMap()).toList();

                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                          AppRoutes.detailedJobScreen,
                          queryParams: {"job": index.toString()});
                    },
                    hoverColor: Colors.blueGrey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10.sp),
                    child: isPhone
                        ? Container(
                            padding: EdgeInsets.all(5.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                        Text("${jobsModel.company_name}"),
                                      ],
                                    ),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Text(
                                              "${timeago.format(jobsModel.posted_on!.toDate())}"),
                                          controller.loggedIN.value
                                              ? StreamBuilder<DocumentSnapshot>(
                                                  stream: FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                          "savedJobsData_jobportal")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .snapshots(),
                                                  builder: (context,
                                                      snapshotOfSavedJobs) {
                                                    if (snapshotOfSavedJobs
                                                        .hasError) {
                                                      return Text(
                                                          'Error: ${snapshotOfSavedJobs.error}');
                                                    }

                                                    if (snapshotOfSavedJobs
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return SizedBox(
                                                          width: 20.sp,
                                                          height: 20.sp,
                                                          child:
                                                              CircularProgressIndicator()); // or any loading indicator
                                                    }
                                                    DocumentSnapshot
                                                        savedJobsDoc =
                                                        snapshotOfSavedJobs
                                                            .data!;
                                                    List listOfJobIds =
                                                        List.from(savedJobsDoc[
                                                            'savedJobsId']);
                                                    return IconButton(
                                                        onPressed: () async {
                                                          if (listOfJobIds.contains(
                                                                  jobsModel
                                                                      .jobid) &&
                                                              jobsModel.jobid !=
                                                                  null) {
                                                            listOfJobIds.remove(
                                                                jobsModel
                                                                    .jobid!);
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "savedJobsData_jobportal")
                                                                .doc(FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid)
                                                                .update({
                                                              "savedJobsId":
                                                                  listOfJobIds
                                                            });
                                                            showToast(
                                                                "Job removed.");
                                                          } else if (jobsModel
                                                                  .jobid !=
                                                              null) {
                                                            controller
                                                                .saveJobsDataId(
                                                              jobId: jobsModel
                                                                  .jobid,
                                                            );
                                                            listOfJobIds.add(
                                                                jobsModel
                                                                    .jobid!);
                                                          } else {
                                                            showToast(
                                                                "Some error has occured.");
                                                          }
                                                        },
                                                        splashRadius: 15.sp,
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_added_rounded,
                                                          color: listOfJobIds
                                                                  .contains(
                                                                      jobsModel
                                                                          .jobid)
                                                              ? Colors.teal
                                                              : Colors.black,
                                                        ));
                                                  })
                                              : SizedBox()
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    overviewRowText(
                                        value: jobsModel.job_location,
                                        iconData: Icons.location_pin,
                                        isPhone: isPhone),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.sp),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              border: Border.all(
                                                  color: Colors.teal)),
                                          child: Text(
                                            "New",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7.sp,
                                        ),
                                        SizedBox(
                                          width: 35.sp,
                                          height: 20.sp,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                applyNowController.easyApplyDialog(
                                                    context,
                                                    job_questions: jobsModel
                                                            .job_questions ??
                                                        [],
                                                    required_skills: jobsModel
                                                            .required_skills ??
                                                        []);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.teal,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp))),
                                              child: Text(
                                                "Easy Apply",
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Container(
                              height: Adaptive.h(22),
                              width: Adaptive.w(55),
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  return Icon(
                                                      Icons.error_outline);
                                                },
                                                imageUrl:
                                                    "https://png.pngtree.com/png-vector/20190624/ourlarge/pngtree-cvjobjob-search-blue-icon-on-abstract-cloud-background-png-image_1492402.jpg",
                                                color: Colors.transparent,
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.low,
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
                                                  Text(
                                                      "${jobsModel.job_domain} ",
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
                                      Obx(() {
                                        return Row(
                                          children: [
                                            Text(
                                                "${timeago.format(jobsModel.posted_on!.toDate())}"),
                                            controller.loggedIN.value
                                                ? StreamBuilder<
                                                        DocumentSnapshot>(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            "savedJobsData_jobportal")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .snapshots(),
                                                    builder: (context,
                                                        snapshotOfSavedJobs) {
                                                      if (snapshotOfSavedJobs
                                                          .hasError) {
                                                        return Text(
                                                            'Error: ${snapshotOfSavedJobs.error}');
                                                      }

                                                      if (snapshotOfSavedJobs
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return SizedBox(
                                                            width: 20.sp,
                                                            height: 20.sp,
                                                            child:
                                                                CircularProgressIndicator()); // or any loading indicator
                                                      }
                                                      DocumentSnapshot
                                                          savedJobsDoc =
                                                          snapshotOfSavedJobs
                                                              .data!;
                                                      List listOfJobIds = List
                                                          .from(savedJobsDoc[
                                                              'savedJobsId']);
                                                      return IconButton(
                                                          onPressed: () async {
                                                            if (listOfJobIds
                                                                    .contains(
                                                                        jobsModel
                                                                            .jobid) &&
                                                                jobsModel
                                                                        .jobid !=
                                                                    null) {
                                                              listOfJobIds.remove(
                                                                  jobsModel
                                                                      .jobid!);
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "savedJobsData_jobportal")
                                                                  .doc(FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid)
                                                                  .update({
                                                                "savedJobsId":
                                                                    listOfJobIds
                                                              });
                                                              showToast(
                                                                  "Job removed.");
                                                            } else if (jobsModel
                                                                    .jobid !=
                                                                null) {
                                                              controller
                                                                  .saveJobsDataId(
                                                                jobId: jobsModel
                                                                    .jobid,
                                                              );
                                                              listOfJobIds.add(
                                                                  jobsModel
                                                                      .jobid!);
                                                            } else {
                                                              showToast(
                                                                  "Some error has occured.");
                                                            }
                                                          },
                                                          splashRadius: 15.sp,
                                                          icon: Icon(
                                                            Icons
                                                                .bookmark_added_rounded,
                                                            color: listOfJobIds
                                                                    .contains(
                                                                        jobsModel
                                                                            .jobid)
                                                                ? Colors.teal
                                                                : Colors.black,
                                                          ));
                                                    })
                                                : SizedBox()
                                          ],
                                        );
                                      }),
                                    ],
                                  ),

                                  sizeBoxOf10,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      overviewRowText(
                                          value: jobsModel.job_location,
                                          iconData: Icons.location_pin),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                border: Border.all(
                                                    color: Colors.teal)),
                                            child: Text(
                                              "New",
                                              style:
                                                  TextStyle(color: Colors.teal),
                                            ),
                                          ),
                                          horizontalSizeBoxOf10,
                                          ElevatedButton(
                                              onPressed: () {
                                                applyNowController.easyApplyDialog(
                                                    context,
                                                    job_questions: jobsModel
                                                            .job_questions ??
                                                        [],
                                                    required_skills: jobsModel
                                                            .required_skills ??
                                                        [],
                                                    offered_salary: jobsModel
                                                        .offered_salary,
                                                    job_domain:
                                                        jobsModel.job_domain,
                                                    job_location:
                                                        jobsModel.job_location,
                                                    jobid: jobsModel.jobid);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.teal,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp))),
                                              child: Text("Easy Apply"))
                                        ],
                                      )
                                    ],
                                  ),
                                  sizeBoxOf10,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          overviewRowText(
                                              value: jobsModel.required_exp,
                                              iconData: Icons.cases_sharp),
                                          overviewRowText(
                                              value: jobsModel.offered_salary,
                                              iconData:
                                                  Icons.stacked_bar_chart),
                                        ],
                                      ),
                                      overviewRowText(
                                          value:
                                              "${jobsModel.number_students_applied} applied",
                                          iconData: Icons.person),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                }),
              ),
            );
          }
        }),
  );
}

Widget overviewRowText(
    {IconData? iconData, String? value, bool isPhone = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.sp),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          iconData != null ? iconData : Icons.add,
          size: 15.sp,
          color: Colors.teal,
        ),
        SizedBox(
          width: 5.sp,
        ),
        SizedBox(
            width: isPhone ? Adaptive.w(25) : Adaptive.w(15),
            child: SelectableText(
              value != null ? value : "Subtitle",
              style: TextStyle(color: Colors.grey),
            )),
      ],
    ),
  );
}
