import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_portal_cloudyml/utils/contants.dart';

class GoogleController extends GetxController {
  RxBool isLoading = false.obs;

  Future<UserCredential?> signIn(String email, String password, context) async {
    try {
      isLoading.value = true;
      saveLoginState(context);
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error during login: $e");
      isLoading.value = false;
      return null;
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error during signup: $e");
      return null;
    }
  }

  Future<void> saveUserDetails(
      String userId,
      String firstname,
      String lastname,
      String orgname,
      String orgemail,
      String businesstype,
      String estcompany,
      String linkedin) async {
    await FirebaseFirestore.instance
        .collection('Users_jobportal')
        .doc(userId)
        .set({
      'id': userId,
      'firstname': firstname,
      'lastname': lastname,
      'organizational email': orgemail,
      'role': "HR",
      'organization name': orgname,
      'business type': businesstype,
      'linkedin id': linkedin,
      'company establishment date': estcompany,
    });
  }
   Future<void> updateUserDetails(
      String userId,
      String firstname,
      String lastname,
      String orgname,
      String orgemail,
      String businesstype,
      String estcompany,
      String linkedin) async {
    await FirebaseFirestore.instance
        .collection('Users_jobportal')
        .doc(userId)
        .update({
      'firstname': firstname,
      'lastname': lastname,
      'organizational email': orgemail,
      'role': "HR",
      'organization name': orgname,
      'business type': businesstype,
      'linkedin id': linkedin,
      'company establishment date': estcompany,
    });
  }

}
