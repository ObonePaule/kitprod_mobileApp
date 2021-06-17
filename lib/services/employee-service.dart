import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kitprod/models/employee.dart';

final String host = '4432a3b40da2.ngrok.io';
final String path = '/employees';

Future<List<Employee>> getEmployeeList(double idExploitation) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable employeesJson = jsonDecode(response.body);
  List<Employee> employees = List<Employee>.from(
      employeesJson.map((modelAsJson) => Employee.fromJson(modelAsJson)));

  return employees;
}

Future<Employee?> insertEmployeeTmp(double idExploitation, String body) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (response.statusCode == 200) {
    return Employee.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
