import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_file/internet_file.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/controllers/student_login/signup.dart';
import 'package:job_portal_cloudyml/screens/profile/widgets/dialog_namechange.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:pdfx/pdfx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_routes.dart';

class ApplyNowController extends GetxController {
  final PageController controller = PageController();
  final selectedIndex = 0.obs;
  final homeController = Get.put(HomeController());
  final singupController = Get.put(SignupController());

  @override
  void onInit() {
    controller.addListener(() {
      selectedIndex.value = controller.page!.round();
    });
    super.onInit();
  }

  Future<void> easyApplyDialog(context,
      {List? job_questions,
      List? required_skills,
      String? job_domain,
      String? offered_salary,
      String? job_location,
      String? jobid}) async {
    RxList<Rx<TextEditingController>> questionControllers = RxList.generate(
      job_questions!.length,
      (index) => TextEditingController().obs,
    );

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext contextOfDialog) {
          return WillPopScope(
            onWillPop: () async {
              selectedIndex.value = 0;
              return true;
            },
            child: Obx(() {
              return homeController.loggedIN.isFalse
                  ? AlertDialog(
                      backgroundColor: mainColor,
                      title: Text(
                        "Please login to apply for the job.",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(contextOfDialog).pop();
                            },
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.white))),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRoutes.studentLogin);
                              Navigator.of(contextOfDialog).pop();
                            },
                            child: Text("Login",
                                style: TextStyle(color: Colors.white)))
                      ],
                    )
                  : homeController.userResumeLink.value.isEmpty
                      ? AlertDialog(
                          backgroundColor: mainColor,
                          title: Text(
                            "Please upload resume to apply for the job.",
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(contextOfDialog).pop();
                                },
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.white))),
                            TextButton(
                                onPressed: () async {
                                  await singupController.selectResume();
                                  singupController.uploadResume();
                                  Navigator.of(contextOfDialog).pop();
                                },
                                child: Text("Upload",
                                    style: TextStyle(color: Colors.white)))
                          ],
                        )
                      : AlertDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp)),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    width: Adaptive.w(50),
                                    height: Adaptive.h(90),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: PageView.custom(
                                      controller: controller,
                                      childrenDelegate:
                                          SliverChildListDelegate([
                                        applyNowItem1(context),
                                        questionsSection(
                                            context, questionControllers,
                                            job_questions: job_questions),
                                        confirmationWindow(questionControllers,
                                            required_skills:
                                                required_skills ?? [],
                                            job_questions: job_questions,
                                            offered_salary: offered_salary,
                                            job_domain: job_domain,
                                            job_location: job_location),
                                      ]),
                                    )),
                              ],
                            ),
                          ),
                          actions: [
                            selectedIndex > 0
                                ? TextButton(
                                    onPressed: () {
                                      controller.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    },
                                    child: Text("Previous"))
                                : Container(),
                            TextButton(onPressed: () async {
                              controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );

                              var listOfApplications = [];

                              if (selectedIndex == 2) {
                                print("jobid $jobid");
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("jobsData_jobportal")
                                      .doc(jobid)
                                      .get()
                                      .then((value) {
                                    if (value.data()!["job_applications"] !=
                                        null) {
                                      listOfApplications =
                                          value.data()!["job_applications"];
                                    }
                                  });

                                  print(
                                      "listOfApplications $listOfApplications");

                                  List listOfAnswers = questionControllers
                                      .map(
                                          (controller) => controller.value.text)
                                      .toList();

                                  if (listOfApplications.isNotEmpty) {
                                    for (var application
                                        in listOfApplications) {
                                      if (application["student_id"] != null &&
                                          application["student_id"] ==
                                              homeController.uid.value) {
                                        showToast(
                                            "You have already applied for the job.");
                                      } else {
                                        print("not matched id");
                                        listOfApplications.add({
                                          "resume_url": homeController
                                              .userResumeLink.value,
                                          "name": homeController.userName.value,
                                          "student_id":
                                              homeController.uid.value,
                                          "answers": listOfAnswers
                                        });
                                        await FirebaseFirestore.instance
                                            .collection("jobsData_jobportal")
                                            .doc(jobid)
                                            .update({
                                          "job_applications": listOfApplications
                                        });
                                        updateJobid(jobid);
                                        showToast(
                                            "You have applied for the job successfully.");
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  } else {
                                    listOfApplications.add({
                                      "resume_url":
                                          homeController.userResumeLink.value,
                                      "name": homeController.userName.value,
                                      "student_id": homeController.uid.value,
                                      "answers": listOfAnswers,
                                      "questions": job_questions
                                    });
                                    await FirebaseFirestore.instance
                                        .collection("jobsData_jobportal")
                                        .doc(jobid)
                                        .update({
                                      "job_applications": listOfApplications
                                    });

                                    updateJobid(jobid);
                                    showToast(
                                        "You have applied for the job successfully.");
                                    Navigator.of(context).pop();
                                    print(
                                        "listOfApplications $listOfApplications");
                                  }
                                } catch (e) {
                                  print("error $e");
                                }
                              }
                            }, child: Obx(() {
                              return Text(
                                  selectedIndex == 2 ? "Confirm" : "Next");
                            })),
                          ],
                        );
            }),
          );
        });
  }

  updateJobid(jobid) async {
    List listOfJobId = [];
    try {
      await FirebaseFirestore.instance
          .collection("savedJobsData_jobportal")
          .doc(homeController.uid.value)
          .get()
          .then((value) {
        if (value.data()!['applied_jobsid'] != null) {
          listOfJobId = value.data()!['applied_jobsid'];
        }
      });
      listOfJobId.add(jobid);

      await FirebaseFirestore.instance
          .collection("savedJobsData_jobportal")
          .doc(homeController.uid.value)
          .update({
        "applied_jobsid": listOfJobId,
        "name": homeController.userName.value
      });
    } catch (e) {
      print("updateJobid of easyApply $e");
    }
  }

  final pdfLoaded = false.obs;

  applyNowItem1(context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: PdfView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          onDocumentError: (error) {
            print('Loading error $error');
            pdfLoaded.value = false;
          },
          onDocumentLoaded: (loaded) {
            print('document loaded $loaded');
            pdfLoaded.value = true;
          },
          controller: PdfController(
            viewportFraction: 1.0,
            document: PdfDocument.openData(
                InternetFile.get(homeController.userResumeLink.value)),
          ),
        ));
  }

  questionsSection(context, questionControllers, {List? job_questions}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp), color: mainColor),
      child: job_questions!.isNotEmpty
          ? Column(
              children: List.generate(job_questions.length, (index) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 15.sp, left: 15.sp, right: 15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(job_questions[index]),
                      sizeBoxOf10,
                      TextField(
                        cursorColor: Colors.white,
                        controller: questionControllers[index].value,
                        decoration: textFieldDecoration,
                      ),
                    ],
                  ),
                );
              }),
            )
          : Center(
              child: Text("There are no questions."),
            ),
    );
  }

  confirmationWindow(ansControllers,
      {List? required_skills,
      List? job_questions,
      String? job_location,
      String? job_domain,
      String? offered_salary}) {
    final matchedSkills = [].obs;

    for (String item in required_skills!) {
      if (homeController.list_of_skills.contains(item)) {
        matchedSkills.add(item);
      }
    }

    final style1 = TextStyle(color: Colors.black);
    final style2 = TextStyle(color: mainColor);

    return SizedBox(
      width: Adaptive.w(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(7.5.sp),
            child: Container(
              padding: EdgeInsets.all(7.5.sp),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.error_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  SizedBox(
                    width: 40.w,
                    child: Text(
                        "Review pre-filled fields to make sure they are correct for this application."),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matched Skills: ",
                  style: TextStyle(color: mainColor),
                ),
                SizedBox(
                  width: 35.w,
                  child: Obx(() {
                    return matchedSkills.isNotEmpty
                        ? Wrap(
                            children: List.generate(matchedSkills.length,
                                (skillIndex) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: 7.5.sp, bottom: 10.sp),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius:
                                          BorderRadius.circular(15.sp)),
                                  padding: EdgeInsets.all(7.5.sp),
                                  child: Obx(() {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          matchedSkills[skillIndex],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.sp),
                                        ),
                                        SizedBox(
                                          width: 3.sp,
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12.5.sp,
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              );
                            }),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.only(right: 7.5.sp, bottom: 10.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.sp)),
                              padding: EdgeInsets.all(7.5.sp),
                              child: Center(
                                child: Text(
                                  "Opps! Found 0 matching skills.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.sp),
                                ),
                              ),
                            ),
                          );
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.sp, left: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Role: ",
                      style: style1,
                    ),
                    Text("${job_domain}", style: style2)
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  children: [
                    Text("Job location: ", style: style1),
                    Text("${job_location}", style: style2),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  children: [
                    Text("Offered salary: ", style: style1),
                    Text("${offered_salary}", style: style2)
                  ],
                ),
              ],
            ),
          ),
          job_questions!.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    width: Adaptive.w(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      // color: Colors.grey.withOpacity(0.15)
                    ),
                    padding: EdgeInsets.all(7.5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(job_questions.length,
                          (job_questionsIndex) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Adaptive.w(48),
                                child: Text(
                                  "${job_questions[job_questionsIndex]}",
                                  style: TextStyle(color: mainColor),
                                ),
                              ),
                              SizedBox(
                                width: Adaptive.w(48),
                                child: Text(
                                  "${ansControllers[job_questionsIndex].value.text}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
