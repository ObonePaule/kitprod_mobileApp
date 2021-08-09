import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'dart:convert';
import 'package:kitprod/models/employee.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/employees';

Future<List<Employee>> getEmployeeList() async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable employeesJson = jsonDecode(response.body);
  List<Employee> employees = List<Employee>.from(
      employeesJson.map((modelAsJson) => Employee.fromJson(modelAsJson)));

  return employees;
}

Future<Employee?> insertEmployeeTmp(String body) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation,
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  var insertedEmployee = Employee.fromJson(json.decode(response.body));
  if (response.statusCode == 200) {
    return insertedEmployee;
  } else {
    return null;
  }
}
