import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/controllers/homescreen_controller/home_controller.dart';

import '../../utils/contants.dart';

class ProfileController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> domainController = TextEditingController().obs;
  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> resumeHeadlineController =
      TextEditingController().obs;
  Rx<TextEditingController> skillController = TextEditingController().obs;

  final homeController = Get.put(HomeController());

  updateNameAndDomain(context) async {
    try {
      if (nameController.value.text.isNotEmpty &&
          domainController.value.text.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userID.value)
            .update({
          "name": nameController.value.text,
          "domain": domainController.value.text
        });
        homeController.userName.value = nameController.value.text;
        homeController.userDomain.value = domainController.value.text;
        nameController.value.clear();
        domainController.value.clear();
        showToast("Information updated");
        Navigator.of(context).pop();
      } else {
        showToast("All fields are required.");
      }
    } catch (e) {
      print("updateNameAndDomain $e");
      showToast("Could not update information.");
    }
  }

  updateCompanyName(context) async {
    try {
      if (companyNameController.value.text.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userID.value)
            .update({
          "currentCompany": companyNameController.value.text,
        });
        homeController.currentCompany.value = companyNameController.value.text;
        companyNameController.value.clear();
        showToast("Company name updated");
        Navigator.of(context).pop();
      } else {
        showToast("Please write name of company.");
      }
    } catch (e) {
      print("updateCompanyName $e");
      showToast("Could not update name.");
    }
  }

  updateResumeHeadline(context) async {
    try {
      if (resumeHeadlineController.value.text.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userID.value)
            .update({
          "resume_headline": resumeHeadlineController.value.text,
        });
        homeController.resume_headline.value =
            resumeHeadlineController.value.text;
        resumeHeadlineController.value.clear();
        showToast("Headline updated");
        Navigator.of(context).pop();
      } else {
        showToast("Please write headline.");
      }
    } catch (e) {
      print("updateResumeHeadline $e");
      showToast("Could not update headline.");
    }
  }

  updateSkills(context, {List? listOfSkills}) async {
    homeController.list_of_skills.value = listOfSkills!;

    if (homeController.list_of_skills == listOfSkills) {
      showToast("No Skills updated.");
      Navigator.of(context).pop();
    } else {
      try {
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userID.value)
            .update({
          "list_of_skills": homeController.list_of_skills,
        });
        skillController.value.clear();
        showToast("Skills updated.");
        Navigator.of(context).pop();
      } catch (e) {
        print("updateSkills $e");
        showToast("Could not update skills.");
      }
    }
  }

  Rx<Uint8List?> profilePictureBytes = Rx<Uint8List?>(null);
  final ppName = ''.obs;

  Future<void> pickProfilePicture() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        // Use `bytes` instead of `path` for web
        profilePictureBytes.value = result.files.single.bytes;
        ppName.value = result.files.first.name;
        uploadProfilePicture();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick a file. $e');
    }
  }

  Future<void> uploadProfilePicture() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.snackbar('Error', 'User not authenticated.');
        return;
      }

      if (profilePictureBytes.value == null) {
        Get.snackbar('Error', 'Please select a profile picture to upload.');
        return;
      }

      final resumeRef = FirebaseStorage.instance.ref(
          'profile_pictures_jobportal/${homeController.userName}/${DateTime.now().millisecondsSinceEpoch}_$ppName');

      // Use `putData` instead of `putFile` for web
      await resumeRef.putData(profilePictureBytes.value!);

      final ppUrl = await resumeRef.getDownloadURL();

      // Update the resume link in the user's document
      await FirebaseFirestore.instance
          .collection('Users_jobportal')
          .doc(user.uid)
          .update({
        'profile_picture': ppUrl,
      });
      homeController.profile_picture.value = ppUrl;
      showToast("Profile picture changed.");
    } catch (e) {
      print("uploadProfilePicture $e");
      Get.snackbar('Error', 'Profile picture upload failed.');
    }
  }

  Rx<TextEditingController> domainNameInExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> companyNameInExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> fromYearInExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> toYearInExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> fulltimeOrExternalInExperienceController =
      TextEditingController().obs;
  Rx<TextEditingController> descriptionInExperienceController =
      TextEditingController().obs;

  Future<void> updateEmployment() async {
    List listOfExperience = [];
    try {
      var education = await FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        if (value.data()!["employment_details"] != null) {
          listOfExperience = value.data()!["employment_details"];
        }
      });

      listOfExperience.add({
        "position": domainNameInExperienceController.value.text,
        "companyName": companyNameInExperienceController.value.text,
        "description": descriptionInExperienceController.value.text,
        "fromYear": int.parse(fromYearInExperienceController.value.text),
        "toYear": int.parse(toYearInExperienceController.value.text),
        "partFullTime": fulltimeOrExternalInExperienceController.value.text,
      });

      await FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"employment_details": listOfExperience});

      degreeController.value.clear();
      collegeNameController.value.clear();
      fromYearController.value.clear();
      toYearController.value.clear();
      descriptionInExperienceController.value.clear();
      fulltimeOrExternalController.value.clear();
      showToast("Employment details updated.");
    } catch (e) {
      print("updateExperience $e");
      showToast("Please try after sometime.");
    }
  }

  Rx<TextEditingController> degreeController = TextEditingController().obs;
  Rx<TextEditingController> collegeNameController = TextEditingController().obs;
  Rx<TextEditingController> fromYearController = TextEditingController().obs;
  Rx<TextEditingController> toYearController = TextEditingController().obs;
  Rx<TextEditingController> fulltimeOrExternalController =
      TextEditingController().obs;

  Future<void> updateEducation() async {
    List listOfEducation = [];
    try {
      var education = await FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        if (value.data()!["education_details"] != null) {
          listOfEducation = value.data()!["education_details"];
        }
      });

      listOfEducation.add({
        "degree": degreeController.value.text,
        "instituteName": collegeNameController.value.text,
        "fromYear": int.parse(fromYearController.value.text),
        "toYear": int.parse(toYearController.value.text),
        "fulltimeOrExternal": fulltimeOrExternalController.value.text,
      });

      await FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"education_details": listOfEducation});

      degreeController.value.clear();
      collegeNameController.value.clear();
      fromYearController.value.clear();
      toYearController.value.clear();
      fulltimeOrExternalController.value.clear();
      showToast("Details updated.");
    } catch (e) {
      showToast("Please try after sometime.");
      print("updateEducation $e");
    }
  }

  Rx<TextEditingController> profileSummaryController =
      TextEditingController().obs;

  updateProfileSummary(context) async {
    try {
      if (profileSummaryController.value.text.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userID.value)
            .update({
          "profile_summary": profileSummaryController.value.text,
        });
        profileSummaryController.value.clear();
        showToast("Profile summary updated.");
        Navigator.of(context).pop();
      } else {
        showToast("Please write summary.");
      }
    } catch (e) {
      print("updateProfileSummary $e");
      showToast("Could not update profile summary.");
    }
  }
}
