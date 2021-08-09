import 'dart:convert';

Removal removalFromJson(String str) => Removal.fromJson(json.decode(str));

String removalToJson(Removal data) => json.encode(data.toJson());

class Removal {
  Removal({
    this.numberOfMales,
    this.numberOfFemales,
    this.numberOfAllComers,
    this.weightByMale,
    this.weightByFemale,
    this.weightByAllComers,
    this.deadWeightCoef,
  });

  int? numberOfMales;
  int? numberOfFemales;
  int? numberOfAllComers;
  double? weightByMale;
  double? weightByFemale;
  double? weightByAllComers;
  double? deadWeightCoef;

  factory Removal.fromJson(Map<String, dynamic> json) => Removal(
        numberOfMales: json["numberOfMales"],
        numberOfFemales: json["numberOfFemales"],
        numberOfAllComers: json["numberOfAllComers"],
        weightByMale: json["weightByMale"].toDouble(),
        weightByFemale: json["weightByFemale"].toDouble(),
        weightByAllComers: json["weightByAllComers"].toDouble(),
        deadWeightCoef: json["deadWeightCoef"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "numberOfMales": numberOfMales,
        "numberOfFemales": numberOfFemales,
        "numberOfAllComers": numberOfAllComers,
        "weightByMale": weightByMale,
        "weightByFemale": weightByFemale,
        "weightByAllComers": weightByAllComers,
        "deadWeightCoef": deadWeightCoef,
      };
}
