import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

import '../../model/home/listed_jobs_model.dart';

class HomeController extends GetxController {
  final userName = ''.obs;
  final userEmail = ''.obs;
  final userExperience = false.obs;
  final userMobileNumber = ''.obs;
  final userDomain = ''.obs;
  final userResumeLink = ''.obs;
  final currentCompany = ''.obs;
  final userSalary = ''.obs;
  Rx<Timestamp> profileUpdatedAt = Timestamp.now().obs;

  getUserDetails() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("Users_jobportal")
          .doc(userId)
          .get()
          .then((value) {
        userName.value = value.data()!["name"];
        userEmail.value = value.data()!["email"];
        userExperience.value = value.data()!["isExperienced"];
        userMobileNumber.value = value.data()!["mobileNumber"];
        userDomain.value = value.data()!["domain"];
        userResumeLink.value = value.data()!["resumeUrl"];
        userRole.value = value.data()!["role"];
        userSalary.value = value.data()!["currentSalary"];
        currentCompany.value = value.data()!["currentCompany"];
        profileUpdatedAt.value = value.data()!["updatedAt"];
      }).whenComplete(() {
        print('Profile details loaded successfully');
          });
    // ignore: empty_catches
    } catch (e) {
    }
  }

  RxList<ListedJobsModel> listOfJobs = <ListedJobsModel>[].obs;

  Stream<List<ListedJobsModel>> streamJobs() {
    // Reference to the Firestore collection
    CollectionReference jobsCollection =
        FirebaseFirestore.instance.collection('jobsData_jobportal');

    // Return a stream of the 'jobs_information' field
    return jobsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            List<dynamic> jobsInformation = doc['job_information'];
            // Assuming each document has a 'jobs_information' field
            return jobsInformation
                .map((job) => ListedJobsModel.fromMap(job))
                .toList();
          })
          .expand((jobsList) => jobsList)
          .toList();
    });
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}
