import 'package:cloud_firestore/cloud_firestore.dart';

class JobPost {
  final String company;
  final String aboutCompany;
  final List<String> companyBenefits;
  final String companyName;
  final String educationList;
  final String eligibilityCriteria;
  final String interviewType;
  final String jobDescription;
  final String jobDomain;
  final String jobLocation;
  final String salary;
  final String jobid;
  //final double minSalary;
  final int numberOfOpenings;
  final int numberStudentsApplied;
  final String postedBy;
  final DateTime postedOn;
  final String requiredExperience;
  final String skillset;
  final String streams;
  final String yearOfPassing;

  JobPost({
    required this.company,
    required this.jobid,
    required this.aboutCompany,
    required this.companyBenefits,
    required this.companyName,
    required this.educationList,
    required this.eligibilityCriteria,
    required this.interviewType,
    required this.jobDescription,
    required this.jobDomain,
    required this.jobLocation,
    required this.salary,
    //required this.minSalary,
    required this.numberOfOpenings,
    required this.numberStudentsApplied,
    required this.postedBy,
    required this.postedOn,
    required this.requiredExperience,
    required this.skillset,
    required this.streams,
    required this.yearOfPassing,
  });

  factory JobPost.fromMap(Map<String, dynamic> map) {
    return JobPost(
      company: map['company'] ?? '',
      jobid: map['jobid']??'',
      aboutCompany: map['about_company'] ?? '',
      companyBenefits: List<String>.from(map['company_benefits'] ?? []),
      companyName: map['company_name'] ?? '',
      educationList: map['education'] ?? '',
      eligibilityCriteria: map['eligibility'] ?? '',
      interviewType: map['interview_type'] ?? '',
      jobDescription: map['job_description'] ?? '',
      jobDomain: map['job_domain'] ?? '',
      jobLocation: map['job_location'] ?? '',
      salary: map['offered_salary'] ?? '',
      numberOfOpenings: map['number_of_openings'] ?? 0,
      numberStudentsApplied: map['number_students_applied'] ?? '',
      postedBy: map['posted_by'] ?? '',
      postedOn: (map['posted_on'] as Timestamp).toDate(),
      requiredExperience: map['required_exp'] ?? '',
      skillset: map['skillset'] ?? '',
      streams: map['streams'] ?? '',
      yearOfPassing: map['year_of_passing'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'company': company,
      'about_company': aboutCompany,
      'company_benefits': companyBenefits,
      'company_name': companyName,
      'education': educationList,
      'eligibility': eligibilityCriteria,
      'interview_type': interviewType,
      'job_description': jobDescription,
      'job_domain': jobDomain,
      'job_location': jobLocation,
      'offered_salary': salary,
      'number_of_openings': numberOfOpenings,
      'number_students_applied': numberStudentsApplied,
      'posted_by': postedBy,
      'posted_on': postedOn,
      'requiredExperience': requiredExperience,
      'skillset': skillset,
      'streams': streams,
      'yearOfPassing': yearOfPassing,
    };
  }
}
