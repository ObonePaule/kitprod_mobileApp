import 'dart:convert';

Charge chargeFromJson(String str) => Charge.fromJson(json.decode(str));

String chargeToJson(Charge data) => json.encode(data.toJson());

class Charge {
  Charge({this.id, required this.chargeType, required this.value});

  String? id;
  String chargeType;
  double? value;

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
      id: json["id"], chargeType: json["chargeType"], value: json["value"]);

  Map<String, dynamic> toJson() => {
        "chargeType": chargeType,
        "value": value,
      };
}
