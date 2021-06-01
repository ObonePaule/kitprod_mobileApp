import 'dart:convert';

// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  Employee({
    this.name,
    this.numberOfHour,
    this.hourCost,
  });

  String name;
  int numberOfHour;
  int hourCost;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"],
        numberOfHour: json["numberOfHour"],
        hourCost: json["hourCost"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "numberOfHour": numberOfHour,
        "hourCost": hourCost,
      };
}
