import 'package:cloud_firestore/cloud_firestore.dart';

class ListedJobsModel {
  String? company_name;
  String? job_domain;
  String? job_locaton;
  String? jobid;
  int? number_of_openings;
  int? number_students_applied;
  String? required_exp;
  String? posted_by;
  String? job_description;
  List? company_benefits;
  Timestamp? posted_on;

  ListedJobsModel(
      {this.company_name,
      this.job_domain,
      this.job_locaton,
      this.jobid,
      this.number_of_openings,
      this.required_exp,
      this.posted_by,
      this.company_benefits,
      this.job_description,
      this.posted_on,
      this.number_students_applied});

  factory ListedJobsModel.fromMap(Map<String, dynamic> map) {
    return ListedJobsModel(
      company_name: map['company_name'],
      job_domain: map['job_domain'],
      job_locaton: map['job_location'],
      jobid: map['jobid'],
      number_of_openings: map['number_of_openings'],
      required_exp: map['required_exp'],
      posted_by: map['posted_by'],
      company_benefits: map['company_benefits'] ?? [],
      job_description: map['job_description'],
      posted_on: map['posted_on'],
      number_students_applied: map['number_students_applied'],
    );
  }
}
