class ApplicantModel {
  String? applicantname;
  String? resumelink;
  String? yearsofexperience;
  String? currentsalary;
  String? domain;
  String? profilepicture;
  String? location;
  String? currentcompany;
  String? profilesummary;
  List<dynamic>? skills; // Added skills property

  ApplicantModel({
    required this.applicantname,
    required this.resumelink,
    required this.yearsofexperience,
    required this.currentsalary,
    required this.domain,
    required this.profilepicture,
    required this.location,
    required this.currentcompany,
    required this.profilesummary,
   required this.skills, // Initialize skills with null
  });
}
