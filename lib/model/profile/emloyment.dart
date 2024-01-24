class EmploymentModel {
  String? position;
  String? companyName;
  String? partFullTime;
  int? toYear;
  int? fromYear;
  String? description;

  EmploymentModel(
      {this.position,
      this.companyName,
      this.partFullTime,
      this.toYear,
      this.fromYear,
      this.description});

  factory EmploymentModel.fromMap(Map<String, dynamic> map) {
    return EmploymentModel(
      position: map['position'],
      companyName: map['companyName'],
      partFullTime: map['partFullTime'],
      fromYear: map['fromYear'],
      toYear: map['toYear'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'companyName': companyName,
      'partFullTime': partFullTime,
      'toYear': toYear,
      'fromYear': fromYear,
      'description': description,
    };
  }
}
