// To parse this JSON data, do
//
//     final lotSheet = lotSheetFromJson(jsonString);

import 'dart:convert';

LotSheet lotSheetFromJson(String str) => LotSheet.fromJson(json.decode(str));

String lotSheetToJson(LotSheet data) => json.encode(data.toJson());

class LotSheet {
  LotSheet({
    this.id,
    this.dateDebut,
    this.dateFin,
    this.loss,
    this.feedingAndCareTime,
    this.removalWeight,
    this.removalNumber,
  });

  String? id;
  DateTime? dateDebut;
  DateTime? dateFin;
  int? loss;
  int? feedingAndCareTime;
  int? removalWeight;
  int? removalNumber;

  factory LotSheet.fromJson(Map<String, dynamic> json) => LotSheet(
        id: json["id"],
        dateDebut: DateTime.parse(json["dateDebut"]),
        dateFin: DateTime.parse(json["dateFin"]),
        loss: json["loss"],
        feedingAndCareTime: json["feedingAndCareTime"],
        removalWeight: json["removalWeight"],
        removalNumber: json["removalNumber"],
      );

  Map<String, dynamic> toJson() => {
        "dateDebut":
            "${dateDebut!.year.toString().padLeft(4, '0')}-${dateDebut!.month.toString().padLeft(2, '0')}-${dateDebut!.day.toString().padLeft(2, '0')}",
        "dateFin":
            "${dateFin!.year.toString().padLeft(4, '0')}-${dateFin!.month.toString().padLeft(2, '0')}-${dateFin!.day.toString().padLeft(2, '0')}",
        "loss": loss,
        "feedingAndCareTime": feedingAndCareTime,
        "removalWeight": removalWeight,
        "removalNumber": removalNumber,
      };
}
