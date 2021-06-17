import 'dart:convert';

Charge chargeFromJson(String str) => Charge.fromJson(json.decode(str));

String chargeToJson(Charge data) => json.encode(data.toJson());

class Charge {
  Charge({
    required this.value,
    required this.chargeType,
  });

  double? value;
  String chargeType;

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        value: json["value"],
        chargeType: json["chargeType"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "chargeType": chargeType,
      };
}
