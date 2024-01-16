import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

import '../../model/home/listed_jobs_model.dart';

class HomeController extends GetxController {
  final uid = ''.obs;
  final userName = ''.obs;
  final userEmail = ''.obs;
  final userExperience = false.obs;
  final userMobileNumber = ''.obs;
  final userDomain = ''.obs;
  final userResumeLink = ''.obs;
  final currentCompany = ''.obs;
  final userSalary = ''.obs;
  final residence = ''.obs;
  final years_of_experience = ''.obs;
  final profile_picture = ''.obs;
  final resume_name = ''.obs;
  final resume_headline = ''.obs;
  final list_of_skills = [].obs;
  Rx<Timestamp> profileUpdatedAt = Timestamp.now().obs;
  final loggedIN = (FirebaseAuth.instance.currentUser != null).obs;

  getUserDetails() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection("Users_jobportal")
            .doc(userId)
            .get()
            .then((value) {
          userName.value = value.data()!["name"] ?? '';
          uid.value = value.data()!["id"] ?? '';
          userEmail.value = value.data()!["email"] ?? '';
          userExperience.value = value.data()!["isExperienced"] ?? '';
          userMobileNumber.value = value.data()!["mobileNumber"] ?? '';
          userDomain.value = value.data()!["domain"] ?? '';
          userResumeLink.value = value.data()!["resumeUrl"] ?? '';
          userRole.value = value.data()!["role"] ?? '';
          userSalary.value = value.data()!["currentSalary"] ?? '';
          currentCompany.value = value.data()!["currentCompany"] ?? '';
          profileUpdatedAt.value = value.data()!["updatedAt"] ?? '';
          residence.value = value.data()!["residence"] ?? '';
          userID.value = value.data()!["id"];
          profile_picture.value = value.data()!["profile_picture"] ?? '';
          years_of_experience.value =
              value.data()!["years_of_experience"] ?? '';
          resume_name.value = value.data()!["resume_name"] ?? '';
          resume_headline.value = value.data()!["resume_headline"] ?? '';
          completionPercentage.value =
              value.data()!["profileCompletionPercentage"] ?? '';
          list_of_skills.value = value.data()!["list_of_skills"] ?? [];
        }).whenComplete(() {
          print("getUserDetails successful");
          profileCompletionPercentage();
        });
      }
    } catch (e) {
      print("getUserDetails $e");
    }
  }

  final completionPercentage = 0.0.obs;

  void profileCompletionPercentage() async {
    int completedItems = 0;
    if (userName.value.isNotEmpty) completedItems++;
    if (profile_picture.value.isNotEmpty) completedItems++;
    if (userEmail.value.isNotEmpty) completedItems++;
    if (years_of_experience.value.isNotEmpty) completedItems++;
    if (userMobileNumber.value.isNotEmpty) completedItems++;
    if (userDomain.value.isNotEmpty) completedItems++;
    if (userResumeLink.value.isNotEmpty) completedItems++;
    if (currentCompany.value.isNotEmpty) completedItems++;
    if (userSalary.value.isNotEmpty) completedItems++;
    if (residence.value.isNotEmpty) completedItems++;
    if (list_of_skills.isNotEmpty) completedItems++;
    completionPercentage.value = (completedItems / 11);

    await FirebaseFirestore.instance
        .collection("Users_jobportal")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "profileCompletionPercentage":
          completionPercentage.value.toPrecision(2).toDouble()
    });

    print(
        "object ${completionPercentage.value.toPrecision(2).toDouble()} ${userSalary.value.isNotEmpty}");
  }

  RxList<ListedJobsModel> listOfJobs = <ListedJobsModel>[].obs;

  Stream<List<ListedJobsModel>>? streamJobs() {
    try {
      // Reference to the Firestore collection
      CollectionReference jobsCollection =
          FirebaseFirestore.instance.collection('jobsData_jobportal');

      // Return a stream of the 'jobs_information' field
      return jobsCollection
          .orderBy('posted_on', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) {
              final Map<String, dynamic>? data =
                  doc.data() as Map<String, dynamic>?;

              if (doc.exists && data!.containsKey('job_information')) {
                List<dynamic> jobsInformation = doc['job_information'];
                // Assuming each document has a 'jobs_information' field
                return jobsInformation
                    .map((job) => ListedJobsModel.fromMap(job))
                    .toList();
              } else {
                return <ListedJobsModel>[];
              }
            })
            .expand((jobsList) => jobsList)
            .toList();
      });
    } catch (e) {
      print("streamJobs $e");
      return null;
    }
  }

  Future<void> getDetailedJob() async {
    try {
      // Reference to the Firestore collection
      CollectionReference jobsCollection =
          await FirebaseFirestore.instance.collection('jobsData_jobportal');

      // Get the documents from the collection
      QuerySnapshot snapshot = await jobsCollection.get();

      // Extract and flatten the 'job_information' field from each document
      List<ListedJobsModel> allJobs = snapshot.docs.expand((doc) {
        return (doc['job_information'] as List<dynamic>)
            .map((job) => ListedJobsModel.fromMap(job))
            .toList();
      }).toList();

      // Assign the retrieved list to listOfJobs
      listOfJobs.assignAll(allJobs);
    } catch (e) {
      print("object - $e");
    }
  }

  RxList listOfSavedJobsId = [].obs;

  // getSavedJobsIds() async {
  //   final userId = await FirebaseAuth.instance.currentUser!.uid;
  //   try {
  //     final docSnapshot = await FirebaseFirestore.instance
  //         .collection("savedJobsData_jobportal")
  //         .doc(userId)
  //         .get();
  //     listOfSavedJobsId.value = docSnapshot["savedJobsId"];
  //     update();
  //   } catch (e) {
  //     print("getSavedJobsIds $e");
  //   }
  // }

  Future<void> saveJobsDataId({String? jobId}) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      // Check if the document with the user's ID exists
      final docSnapshot = await FirebaseFirestore.instance
          .collection("savedJobsData_jobportal")
          .doc(userId)
          .get();

      if (docSnapshot.exists) {
        listOfSavedJobsId.value = docSnapshot["savedJobsId"];
        List listOfIds = docSnapshot["savedJobsId"];
        if (listOfIds.contains(jobId)) {
          Fluttertoast.showToast(msg: "Job already saved to your saved jobs.");
        } else {
          listOfIds.add(jobId);
          // Update the existing document
          await FirebaseFirestore.instance
              .collection("savedJobsData_jobportal")
              .doc(userId)
              .update({
            "userId": userId,
            "savedJobsId": listOfIds,
          });
          Fluttertoast.showToast(msg: "Yay! Job added to saved jobs.");
        }
      } else {
        // Create a new document
        await FirebaseFirestore.instance
            .collection("savedJobsData_jobportal")
            .doc(userId)
            .set({
          "userId": userId,
          "savedJobsId": FieldValue.arrayUnion([jobId]),
        });
        Fluttertoast.showToast(msg: "Yay! Job added to saved jobs.");
      }
    } catch (e) {
      print("saveJobsDataId $e");
      Fluttertoast.showToast(
          msg: "Failed to save job. Please try again later.");
    }
  }

  @override
  void onInit() {
    loggedIN.value ? getUserDetails() : null;
    super.onInit();
  }
}
