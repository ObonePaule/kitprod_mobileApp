// To parse this JSON data, do
//
//     final building = buildingFromJson(jsonString);

import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({
    required this.name,
    this.space,
    this.numberOfLots,
    this.lots,
  });

  String name;
  int? space;
  int? numberOfLots;
  List? lots;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
      name: json["name"],
      space: json["space"],
      numberOfLots: json["numberOfLots"],
      lots: null);

  Map<String, dynamic> toJson() => {
        "name": name,
        "space": space,
        "numberOfLots": numberOfLots,
        "lots": null
      };
}
