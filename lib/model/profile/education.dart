class EducationModel {
  String? degree;
  String? instituteName;
  int? fromYear;
  int? toYear;
  String? fulltimeOrExternal;

  EducationModel(
      {this.degree,
      this.fromYear,
      this.fulltimeOrExternal,
      this.instituteName,
      this.toYear});

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      degree: map['degree'],
      instituteName: map['instituteName'],
      fromYear: map['fromYear'],
      toYear: map['toYear'],
      fulltimeOrExternal: map['fulltimeOrExternal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'degree': degree,
      'instituteName': instituteName,
      'fromYear': fromYear,
      'toYear': toYear,
      'fulltimeOrExternal': fulltimeOrExternal,
    };
  }
}
