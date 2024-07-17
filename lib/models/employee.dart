import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  Employee({
    this.id,
    required this.name,
    required this.numberOfHour,
    required this.hourCost,
  });

  double? id;
  String name;
  double? numberOfHour;
  double? hourCost;

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
