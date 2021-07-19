// To parse this JSON data, do
//
//     final fixedTask = fixedTaskFromJson(jsonString);

import 'dart:convert';

FixedTask fixedTaskFromJson(String str) => FixedTask.fromJson(json.decode(str));

String fixedTaskToJson(FixedTask data) => json.encode(data.toJson());

class FixedTask {
  FixedTask({
    this.id,
    required this.fixedTaskType,
    required this.value,
  });

  String? id;
  String fixedTaskType;
  double? value;

  factory FixedTask.fromJson(Map<String, dynamic> json) => FixedTask(
        id: json["id"],
        fixedTaskType: json["fixedTaskType"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "fixedTaskType": fixedTaskType,
        "value": value,
      };
}
