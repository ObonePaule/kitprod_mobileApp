import 'dart:convert';

RawMaterial rawMaterialFromJson(String str) =>
    RawMaterial.fromJson(json.decode(str));

String rawMaterialToJson(RawMaterial data) => json.encode(data.toJson());

class RawMaterial {
  RawMaterial({
    required this.name,
    required this.proportion,
    required this.mpPrice,
  });

  String name;
  double? proportion;
  double? mpPrice;

  factory RawMaterial.fromJson(Map<String, dynamic> json) => RawMaterial(
        name: json["name"],
        proportion: json["proportion"],
        mpPrice: json["mpPrice"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "proportion": proportion,
        "mpPrice": mpPrice,
      };
}
