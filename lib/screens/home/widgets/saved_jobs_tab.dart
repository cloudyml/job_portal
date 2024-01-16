import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../model/home/saved_jobs_model.dart';
import '../../../utils/contants.dart';
import 'jobs_tab.dart';

Widget savedJobsTab() {
  final List<String> listOfJobIds;
  return Padding(
    padding: EdgeInsets.only(top: 10.sp),
    child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("savedJobsData_jobportal")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshotOfSavedJobs) {
          if (snapshotOfSavedJobs.hasError) {
            return Text('Error: ${snapshotOfSavedJobs.error}');
          }

          if (snapshotOfSavedJobs.connectionState == ConnectionState.waiting) {
            return SizedBox(
                width: 20.sp,
                height: 20.sp,
                child: CircularProgressIndicator()); // or any loading indicator
          }

          DocumentSnapshot savedJobsDoc = snapshotOfSavedJobs.data!;
          List listOfJobIds = List.from(savedJobsDoc['savedJobsId']);
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("jobsData_jobportal")
                  .orderBy("posted_on", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      width: 20.sp,
                      height: 20.sp,
                      child: CircularProgressIndicator());
                }
                List<QueryDocumentSnapshot> jobDocs = snapshot.data!.docs;
                List<QueryDocumentSnapshot> filteredJobs = jobDocs.where((job) {
                  return listOfJobIds.contains(job.id);
                }).toList();
                if (filteredJobs.isEmpty) {
                  return Center(
                    child: Text('Your saved job will appear here.'),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: List.generate(filteredJobs.length, (index) {
                      Map<String, dynamic> jobData =
                          filteredJobs[index].data() as Map<String, dynamic>;
                      List<dynamic> jobInformationList =
                          jobData['job_information'];
                      List<SavedJobsModel> jobInformationModels =
                          jobInformationList
                              .map((jobInformation) =>
                                  SavedJobsModel.fromMap(jobInformation))
                              .toList();
                      return Column(
                        children:
                            List.generate(jobInformationModels.length, (index) {
                          var jobInformationModel = jobInformationModels[index];
                          return InkWell(
                            onTap: () {
                              // GoRouter.of(context).pushNamed(
                              //     AppRoutes.detailedJobScreen,
                              //     queryParams: {"job": index.toString()});
                            },
                            hoverColor: Colors.blueGrey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Padding(
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
                                                        "${jobInformationModel.job_domain} ",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        "• ${jobInformationModel.number_of_openings} openings"),
                                                  ],
                                                ),
                                                sizeBoxOf10,
                                                Text(
                                                    "${jobInformationModel.company_name}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                "${timeago.format(jobInformationModel.posted_on!.toDate())}"),
                                            IconButton(
                                                onPressed: () async {
                                                  listOfJobIds.remove(
                                                      jobInformationModel
                                                          .jobid);
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                          "savedJobsData_jobportal")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .update({
                                                    "savedJobsId": listOfJobIds
                                                  });

                                                  showToast("Job removed.");
                                                  // controller.saveJobsDataId(
                                                  //   jobId: jobInformationModel.jobid,
                                                  //   // jobsList: listOfJobsAsMap
                                                  // );
                                                },
                                                splashRadius: 15.sp,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
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
                                            value:
                                                jobInformationModel.job_locaton,
                                            iconData: Icons.location_pin),
                                        ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp))),
                                            child: const Text("Easy Apply"))
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
                                                value: jobInformationModel
                                                    .required_exp,
                                                iconData: Icons.cases_sharp),
                                            overviewRowText(
                                                value: jobInformationModel
                                                    .offered_salary,
                                                iconData:
                                                    Icons.stacked_bar_chart),
                                          ],
                                        ),
                                        overviewRowText(
                                            value:
                                                "${jobInformationModel.number_students_applied} applied",
                                            iconData: Icons.person),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                );
              });
        }),
  );
}
