import 'dart:convert';

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({this.id, this.name, this.surface, this.numberOfLots, this.lots});

  String? id;
  String? name;
  int? surface;
  int? numberOfLots;
  List<dynamic>? lots;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
      id: json["id"],
      name: json["name"],
      surface: json["surface"],
      numberOfLots: json["numberOfLots"],
      lots: json["lots"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "surface": surface,
        "numberOfLots": numberOfLots,
        "lots": []
      };
}
