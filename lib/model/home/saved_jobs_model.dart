import 'package:cloud_firestore/cloud_firestore.dart';

class SavedJobsModel {
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
  String? education;
  String? year_of_passing;
  String? eligibility;
  String? skill_set;
  String? streams;
  String? offered_salary;
  String? interview_type;

  SavedJobsModel(
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
      this.number_students_applied,
      this.education,
      this.eligibility,
      this.skill_set,
      this.streams,
      this.year_of_passing,
      this.offered_salary,
      this.interview_type});

  factory SavedJobsModel.fromMap(Map<String, dynamic> map) {
    return SavedJobsModel(
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
        education: map['education'],
        eligibility: map['eligibility'],
        skill_set: map['skill_set'],
        streams: map['streams'],
        year_of_passing: map['year_of_passing'],
        offered_salary: map["offered_salary"],
        interview_type: map['interview_type']);
  }

  Map<String, dynamic> toMap() {
    return {
      'company_name': company_name,
      'job_domain': job_domain,
      'job_location': job_locaton,
      'jobid': jobid,
      'number_of_openings': number_of_openings,
      'required_exp': required_exp,
      'posted_by': posted_by,
      'company_benefits': company_benefits,
      'job_description': job_description,
      'posted_on': posted_on,
      'number_students_applied': number_students_applied,
      'education': education,
      'eligibility': eligibility,
      'skill_set': skill_set,
      'streams': streams,
      'year_of_passing': year_of_passing,
      'offered_salary': offered_salary,
      'interview_type': interview_type,
    };
  }
}
