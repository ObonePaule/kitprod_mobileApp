import 'dart:convert';

Lot lotFromJson(String str) => Lot.fromJson(json.decode(str));

String lotToJson(Lot data) => json.encode(data.toJson());

class Lot {
  Lot(
      {this.id,
      this.name,
      this.species,
      this.mepAge,
      this.costByAnimal,
      this.number,
      this.costOfLitter,
      this.lotSheet
      //required this.isArchived,
      });

  String? id;
  String? name;
  String? species;
  int? mepAge;
  double? costByAnimal;
  int? number;
  double? costOfLitter;
  List? lotSheet;
  //bool isArchived;

  factory Lot.fromJson(Map<String, dynamic> json) => Lot(
      id: json["id"],
      name: json["name"],
      species: json["species"],
      mepAge: json["mepAge"],
      costByAnimal: json["costByAnimal"],
      number: json["number"],
      costOfLitter: json["costOfLitter"],
      lotSheet: null
      //isArchived: json["isArchived"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "species": species,
        "mepAge": mepAge,
        "costByAnimal": costByAnimal,
        "number": number,
        "costOfLitter": costOfLitter,
        "lotSheet": null
        //"isArchived": isArchived,
      };
}
