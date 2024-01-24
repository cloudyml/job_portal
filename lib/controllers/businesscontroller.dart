import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/businessmodel.dart';
//import 'model/businessmodel.dart';
//import '../model/home/businessmodel.dart';
//import 'provider/businessprovider.dart';

class FirestoreService {
  final CollectionReference businessCollection =
      FirebaseFirestore.instance.collection('Users_jobportal');
 BusinessModel? businessData1;
  Future<void> getBusinessData() async {
    try {
      final DocumentSnapshot<Object?> snapshot = await businessCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final businessData = BusinessModel(
        businessType: snapshot['business type'],
        establishmentDate: snapshot['company establishment date'],
        description: snapshot['description'],
        firstName: snapshot['firstname'],
        lastName: snapshot['lastname'],
        linkedinId: snapshot['linkedin id'],
        organizationName: snapshot['organization name'],
        organizationalEmail: snapshot['organizational email'],
        role: snapshot['role'],
      );

      businessData1 = businessData;

      print('Business data retrieved from Firestore: $businessData');
    } catch (e) {
      print('Error retrieving business data: $e');
    }
  }

  final CollectionReference jobsCollection =
      FirebaseFirestore.instance.collection('jobsData_jobportal');

  Future<String?> saveJobData(Map<String, dynamic> formData) async {
    try {
      // Add the data to Firestore and get the document ID
      DocumentReference documentReference = await jobsCollection.add({
        "job_information": [formData],
      });
      String jobId = documentReference.id;

      // Update the 'job_id' field with the document ID
      await documentReference.update({'job_id': jobId});

      print('Job data saved to Firestore with ID: $jobId');
      return jobId;
    } catch (e) {
      print('Error saving job data: $e');
      return null;
    }
  }
}
