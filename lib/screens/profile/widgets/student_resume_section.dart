import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/controllers/profile/profile_controller.dart';
import 'package:job_portal_cloudyml/model/profile/education.dart';
import 'package:job_portal_cloudyml/model/profile/emloyment.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/dialog_namechange.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/student_login/signup.dart';
import '../../../utils/colors.dart';

Widget commonContainer({Widget? child, double? topPadding}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.sp),
    child: Container(
      width: Adaptive.w(60),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.only(
          right: 10.sp,
          left: 10.sp,
          bottom: 10.sp,
          top: topPadding != null ? topPadding : 0.sp),
      child: child,
    ),
  );
}

Widget studentResumeSection(
    HomeController homeController, SignupController signUpController) {
  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Resume",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        sizeBoxOf10,
        Text(
            "Resume is the most important document recruiters look for. Recruiters generally do not look at profiles without resumes."),
        sizeBoxOf10,
        homeController.resume_name.value.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homeController.resume_name.value,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                  IconButton(
                      onPressed: () {
                        launch(homeController.userResumeLink.value);
                      },
                      splashRadius: 14.sp,
                      icon: Icon(
                        Icons.download_for_offline_outlined,
                        size: 15.sp,
                        color: mainColor,
                      ))
                ],
              )
            : SizedBox(),
        Container(
          height: Adaptive.h(14),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: Colors.grey.withOpacity(0.01),
          ),
          child: DottedBorder(
            color: mainColor,
            stackFit: StackFit.expand,
            dashPattern: [2, 2],
            borderType: BorderType.RRect,
            strokeWidth: 1,
            radius: Radius.circular(10.sp),
            strokeCap: StrokeCap.round,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await signUpController.selectResume();
                      signUpController.uploadResume();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(15.sp))),
                    child: Text(
                      "Upload resume",
                      style: TextStyle(color: mainColor),
                    )),
                sizeBoxOf10,
                SelectableText(
                  "Supported Formats: doc, docx, rtf, pdf, upto 2 MB",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  });
}

Widget resumeHeadline(HomeController homeController, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text("Resume headline",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          IconButton(
              onPressed: () {
                headlineDialog(context);
              },
              splashRadius: 14.sp,
              icon: Icon(
                Icons.edit,
                size: 15.sp,
                color: mainColor,
              ))
        ],
      ),
      SizedBox(
        height: 5.sp,
      ),
      Obx(() {
        return SelectableText(
            homeController.resume_headline.value.isNotEmpty
                ? homeController.resume_headline.value
                : "Flutter Developer with expertise in developing cross-platform mobile applications using Flutter and Dart programming language.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontSize: 12.sp));
      }),
    ],
  );
}

Widget keySkills(HomeController homeController, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text("Key skills",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          IconButton(
              onPressed: () {
                addSkillsDialog(context);
              },
              splashRadius: 14.sp,
              icon: Icon(
                Icons.edit,
                size: 15.sp,
                color: mainColor,
              ))
        ],
      ),
      SizedBox(
        height: 5.sp,
      ),
      Obx(() {
        return homeController.list_of_skills.isNotEmpty &&
                homeController.list_of_skills != null
            ? Wrap(
                children: List.generate(homeController.list_of_skills.length,
                    (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 7.5.sp, bottom: 10.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15.sp)),
                      padding: EdgeInsets.all(10.sp),
                      child: Obx(() {
                        return Text(
                          homeController.list_of_skills[index],
                          style: TextStyle(color: Colors.white),
                        );
                      }),
                    ),
                  );
                }),
              )
            : const Text("Please add skills to attract recruiters.");
      })
    ],
  );
}

Widget employmentSection(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Employment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          TextButton(
              onPressed: () {
                addEmploymentDialog(context);
              },
              child: const Text("Add employment"))
        ],
      ),
      StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users_jobportal")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!.data()!["employment_details"] == null ||
                snapshot.data!.data()!["employment_details"].isEmpty) {
              return SelectableText("Please add employment details.",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12.sp));
            }

            List<dynamic> employmentDetailData =
                snapshot.data!.get("employment_details");
            List<EmploymentModel> employmentDetail = employmentDetailData
                .map((data) => EmploymentModel.fromMap(data))
                .toList();

            return Column(
              children: List.generate(employmentDetail.length, (index) {
                var employment = employmentDetail[index];
                return Container(
                  padding: EdgeInsets.only(bottom: 5.sp, left: 11.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(employment.position!,
                              style: GoogleFonts.arbutusSlab(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () async {
                                employmentDetail
                                    .remove(employmentDetail[index]);
                                List<Map<String, dynamic>> educationDetailData =
                                    employmentDetail
                                        .map((education) => education.toMap())
                                        .toList();
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("Users_jobportal")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    "employment_details": educationDetailData,
                                  });
                                  showToast("Employment removed successfully.");
                                } catch (e) {
                                  showToast("Please try after sometime.");
                                  print("object $e");
                                }
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                      SelectableText(employment.companyName!,
                          style: GoogleFonts.arbutusSlab(
                              fontWeight: FontWeight.w300, fontSize: 13.sp)),
                      SelectableText(
                          "${employment.partFullTime!} | ${employment.fromYear!} - ${employment.toYear!}",
                          style: GoogleFonts.arbutusSlab(
                              fontWeight: FontWeight.w300, fontSize: 13.sp)),
                      SelectableText(employment.description!,
                          style: GoogleFonts.arbutusSlab(
                              fontWeight: FontWeight.w100, fontSize: 12.sp))
                    ],
                  ),
                );
              }),
            );
          })
    ],
  );
}

Widget educationSection(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Education",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          TextButton(
              onPressed: () {
                addEducationDialog(context);
              },
              child: Text("Add education")),
        ],
      ),
      StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users_jobportal")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!.data()!["education_details"] == null) {
              return SizedBox(
                child: SelectableText("Please add education details.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 12.sp)),
              );
            }
            List<dynamic> educationDetailData =
                snapshot.data!.data()!["education_details"];
            List<EducationModel> educationDetail = educationDetailData
                .map((data) => EducationModel.fromMap(data))
                .toList();

            if (educationDetail.isEmpty) {
              return SelectableText("Please add education details.",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12.sp));
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(educationDetail.length, (index) {
                var education = educationDetail[index];
                return Padding(
                  padding: EdgeInsets.all(7.5.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectableText(education.degree!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp)),
                          TextButton(
                              onPressed: () async {
                                educationDetail.remove(educationDetail[index]);
                                List<Map<String, dynamic>> educationDetailData =
                                    educationDetail
                                        .map((education) => education.toMap())
                                        .toList();
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("Users_jobportal")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    "education_details": educationDetailData,
                                  });
                                  showToast("Education removed successfully.");
                                } catch (e) {
                                  showToast("Please try after sometime.");
                                  print("object $e");
                                }
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                      SelectableText(education.instituteName!,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12.sp)),
                      SelectableText(
                          "${education.fromYear}-${education.toYear} | ${education.fulltimeOrExternal}",
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 12.sp)),
                    ],
                  ),
                );
              }),
            );
          })
    ],
  );
}

Widget profileSummarySection(context, ProfileController profileController) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        String? profileSummary = snapshot.data!.data()!["profile_summary"];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Profile Summary",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.sp)),
                TextButton(
                    onPressed: () {
                      profileController.profileSummaryController.value.text =
                          profileSummary ?? '';
                      profileSummaryDialog(context);
                    },
                    child: Text("Add Profile Summary")),
              ],
            ),
            SizedBox(
              height: 5.sp,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Users_jobportal")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  String? profileSummary =
                      snapshot.data!.data()!["profile_summary"];
                  return SelectableText(
                      profileSummary ??
                          "Your Profile Summary should mention the highlights of your career and education, what your professional interests are, and what kind of a career you are looking for. Write a meaningful summary of more than 50 characters.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 12.sp));
                }),
          ],
        );
      });
}

Widget languageProficiency() {
  List languagesTitle = ["Languages", "Proficiency", "Read", "Write", "Speak"];
  List languages = [
    "Gujarati",
    "Hindi",
    "English",
  ];
  List proficiency = [
    "Proficient",
    "Proficient",
    "Proficient",
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Languages",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
          TextButton(onPressed: () {}, child: Text("Add Languages")),
        ],
      ),
      SizedBox(
        height: 10.sp,
      ),
      Padding(
        padding: EdgeInsets.only(right: 10.sp, left: 5.sp),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(languagesTitle.length, (index) {
                return Text(languagesTitle[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 13.sp));
              }),
            ),
            SizedBox(
                width: double.infinity,
                child: Divider(
                  thickness: 1,
                  color: mainColor,
                )),
            Column(
              children: List.generate(3, (index) {
                return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(languages[index]),
                      Text(proficiency[index]),
                      Checkbox(value: true, onChanged: (value) {}),
                      Checkbox(value: true, onChanged: (value) {}),
                      Checkbox(value: true, onChanged: (value) {})
                    ]);
              }),
            )
          ],
        ),
      ),
    ],
  );
}
