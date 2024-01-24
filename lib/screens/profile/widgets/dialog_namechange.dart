import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';
import 'package:job_portal_cloudyml/controllers/profile/profile_controller.dart';
import 'package:job_portal_cloudyml/utils/colors.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> showAlertDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: Text(
          'Update Information',
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: profileController.nameController.value,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  )),
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            TextField(
              controller: profileController.domainController.value,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  labelText: 'Domain Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                  )),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Update',
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              profileController.updateNameAndDomain(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> dialogToAddCompanyName(BuildContext context) async {
  final profileController = Get.put(ProfileController());

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: Text(
          'Add company name',
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: profileController.companyNameController.value,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              labelText: 'Company name',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent),
              )),
          style: const TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Update',
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              profileController.updateCompanyName(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> headlineDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: const Text(
          'Write headline',
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: Adaptive.w(50),
          child: TextField(
            controller: profileController.resumeHeadlineController.value,
            cursorColor: Colors.white,
            maxLines: 2,
            decoration: textFieldDecoration.copyWith(
              labelText: 'Write headline',
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              profileController.updateResumeHeadline(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> addSkillsDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());
  final homeController = Get.put(HomeController());
  RxList listOfSkills = [].obs;
  final focusNode = FocusNode();
  listOfSkills.addAll(homeController.list_of_skills);
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        content: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Container(
            // height: Adaptive.h(50),
            width: Adaptive.w(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: profileController.skillController.value,
                    cursorColor: Colors.white,
                    focusNode: focusNode,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Add skill',
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (profileController
                                  .skillController.value.text.isNotEmpty) {
                                listOfSkills.add(profileController
                                    .skillController.value.text);
                                profileController.skillController.value.clear();
                                focusNode.requestFocus();
                              }
                            },
                            splashRadius: 14.sp,
                            icon: Icon(
                              Icons.add,
                              size: 15.sp,
                              color: Colors.white,
                            )),
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent),
                        )),
                    onSubmitted: (value) {
                      if (profileController
                              .skillController.value.text.isNotEmpty &&
                          !listOfSkills.contains(
                              profileController.skillController.value.text)) {
                        listOfSkills
                            .add(profileController.skillController.value.text);
                        profileController.skillController.value.clear();
                        focusNode.requestFocus();
                      } else if (listOfSkills.contains(
                          profileController.skillController.value.text)) {
                        showToast(
                            "${profileController.skillController.value.text} already exists in your skills.");
                        focusNode.requestFocus();
                        profileController.skillController.value.clear();
                      } else {
                        showToast("Cannot add empty space");
                        focusNode.requestFocus();
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  sizeBoxOf10,
                  Obx(() {
                    return Wrap(
                      children: List.generate(listOfSkills.length, (index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(right: 7.5.sp, bottom: 10.sp),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.sp)),
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() {
                                  return Text(
                                    listOfSkills[index],
                                    style: TextStyle(color: mainColor),
                                  );
                                }),
                                IconButton(
                                  constraints: BoxConstraints(),
                                  splashRadius: 12.sp,
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 14.sp,
                                  ),
                                  onPressed: () {
                                    listOfSkills.remove(listOfSkills[index]);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await profileController.updateSkills(context,
                  listOfSkills: listOfSkills);
            },
          ),
        ],
      );
    },
  );
}

Future<void> addEmploymentDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: Text(
          "Employment details",
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: Adaptive.w(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller:
                    profileController.domainNameInExperienceController.value,
                cursorColor: Colors.white,
                decoration: textFieldDecoration.copyWith(labelText: "Role"),
              ),
              sizeBoxOf10,
              TextField(
                controller:
                    profileController.companyNameInExperienceController.value,
                cursorColor: Colors.white,
                decoration:
                    textFieldDecoration.copyWith(labelText: "Company name"),
              ),
              sizeBoxOf10,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: profileController
                          .fromYearInExperienceController.value,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration:
                          textFieldDecoration.copyWith(labelText: "From year"),
                    ),
                  ),
                  horizontalSizeBoxOf10,
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.number,
                      controller:
                          profileController.toYearInExperienceController.value,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration:
                          textFieldDecoration.copyWith(labelText: "To year"),
                    ),
                  ),
                ],
              ),
              sizeBoxOf10,
              TextField(
                cursorColor: Colors.white,
                controller: profileController
                    .fulltimeOrExternalInExperienceController.value,
                decoration: textFieldDecoration.copyWith(
                    labelText: "Full time or part time"),
              ),
              sizeBoxOf10,
              TextField(
                cursorColor: Colors.white,
                controller:
                    profileController.descriptionInExperienceController.value,
                maxLines: 3,
                decoration: textFieldDecoration.copyWith(
                    labelText: "Summary of work experience"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await profileController.updateEmployment();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> addEducationDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: Text("Education details", style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: Adaptive.w(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: profileController.degreeController.value,
                cursorColor: Colors.white,
                decoration: textFieldDecoration.copyWith(
                    labelText: "Enter name of your course/degree"),
              ),
              sizeBoxOf10,
              TextField(
                controller: profileController.collegeNameController.value,
                cursorColor: Colors.white,
                decoration: textFieldDecoration.copyWith(
                    labelText: "Enter name of your college/institute/college"),
              ),
              sizeBoxOf10,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: profileController.fromYearController.value,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration:
                          textFieldDecoration.copyWith(labelText: "From year"),
                    ),
                  ),
                  horizontalSizeBoxOf10,
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.number,
                      controller: profileController.toYearController.value,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration:
                          textFieldDecoration.copyWith(labelText: "To year"),
                    ),
                  ),
                ],
              ),
              sizeBoxOf10,
              TextField(
                cursorColor: Colors.white,
                controller:
                    profileController.fulltimeOrExternalController.value,
                decoration: textFieldDecoration.copyWith(
                    labelText: "Full time or external course"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await profileController.updateEducation();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> profileSummaryDialog(BuildContext context) async {
  final profileController = Get.put(ProfileController());
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.teal,
        content: SizedBox(
          width: Adaptive.w(50),
          child: TextField(
            controller: profileController.profileSummaryController.value,
            cursorColor: Colors.white,
            maxLines: 2,
            decoration: const InputDecoration(
                labelText: 'Write profile summary',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent),
                )),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              profileController.updateProfileSummary(context);
            },
          ),
        ],
      );
    },
  );
}

final textFieldDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.tealAccent),
    ));
