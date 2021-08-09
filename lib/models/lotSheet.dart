import 'dart:convert';
import 'package:kitprod/models/removal.dart';

LotSheet lotSheetFromJson(String str) => LotSheet.fromJson(json.decode(str));

String lotSheetToJson(LotSheet data) => json.encode(data.toJson());

class LotSheet {
  LotSheet(
      {this.id,
      required this.dateDebut,
      this.loss,
      this.dailyFood,
      this.complement,
      this.feedingAndCareTime,
      this.manufacturingTime,
      this.specialEvent,
      this.removal});

  String? id;
  DateTime dateDebut;
  int? loss;
  DailyFood? dailyFood;
  String? complement;
  double? feedingAndCareTime;
  double? manufacturingTime;
  SpecialEvent? specialEvent;
  Removal? removal;

  factory LotSheet.fromJson(Map<String, dynamic> json) => LotSheet(
        id: json["id"],
        dateDebut: DateTime.parse(json["dateDebut"]),
        loss: json["loss"],
        dailyFood: DailyFood.fromJson(json["dailyFood"]),
        complement: json["complement"],
        feedingAndCareTime: json["feedingAndCareTime"],
        manufacturingTime: json["manufacturingTime"],
        specialEvent: SpecialEvent.fromJson(json["specialEvent"]),
        removal: Removal.fromJson(json["removal"]),
      );

  Map<String, dynamic> toJson() => {
        "dateDebut":
            "${dateDebut.year.toString().padLeft(4, '0')}-${dateDebut.month.toString().padLeft(2, '0')}-${dateDebut.day.toString().padLeft(2, '0')}",
        "loss": loss,
        "dailyFood": dailyFood!.toJson(),
        "complement": complement,
        "feedingAndCareTime": feedingAndCareTime,
        "manufacturingTime": manufacturingTime,
        "specialEvent": specialEvent!.toJson(),
        "removal": removal!.toJson(),
      };
}

class SpecialEvent {
  SpecialEvent({
    this.vaccin,
    this.fraisVeterinaires,
  });

  double? vaccin;
  double? fraisVeterinaires;

  factory SpecialEvent.fromJson(Map<String, dynamic> json) => SpecialEvent(
        vaccin: json["vaccin"],
        fraisVeterinaires: json["frais veterinaires"],
      );

  Map<String, dynamic> toJson() => {
        "vaccin": vaccin,
        "frais veterinaires": fraisVeterinaires,
      };
}

class DailyFood {
  DailyFood({
    required this.type,
    required this.value,
  });

  String? type;
  double? value;

  factory DailyFood.fromJson(Map<String, dynamic> json) => DailyFood(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
