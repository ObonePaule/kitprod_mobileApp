// To parse this JSON data, do
//
//     final fixedTask = fixedTaskFromJson(jsonString);

import 'dart:convert';

FixedTask fixedTaskFromJson(String str) => FixedTask.fromJson(json.decode(str));

String fixedTaskToJson(FixedTask data) => json.encode(data.toJson());

class FixedTask {
  FixedTask({
    required this.fixedTaskType,
    required this.value,
  });

  String fixedTaskType;
  double? value;

  factory FixedTask.fromJson(Map<String, dynamic> json) => FixedTask(
        fixedTaskType: json["fixedTaskType"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "fixedTaskType": fixedTaskType,
        "value": value,
      };
}
