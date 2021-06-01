import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kitprod/providers/employee.dart';
import 'package:kitprod/providers/mydata.dart';

class EmployeeFormPage extends StatefulWidget {
  static const String routeName = "/employeeform";

  @override
  _EmployeeFormPageState createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  late String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un employé"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: txtname,
                  decoration: InputDecoration(
                      hintText: "Nom de l'employé",
                      labelText: "Nom de l'employé"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtnumber,
                  decoration: InputDecoration(
                      hintText: "Nombre d'heures par an",
                      labelText: "Nombre d'heures par an"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: txtcost,
                  decoration: InputDecoration(
                      hintText: "Cout horaire", labelText: "Cout horaire"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Employee obj = Employee(
                        hourCost: int.tryParse(txtcost.text.trim()),
                        name: txtname.text.trim(),
                        numberOfHour: int.tryParse(txtnumber.text.trim()));

                    var body = jsonEncode(obj.toJson());
                    print(body);
                    obj = (await insertEmployee(body))!;
                    print(obj);
                    // setState(() {
                    //   if (obj != null) {
                    //     result = obj.name;
                    //   } else {
                    //     return "Can not complete";
                    //   }
                    // });
                  },
                  child: Text("Enregistrer"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    minimumSize: Size(350, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Employee?> insertEmployee(String body) async {
    final api =
        Uri.parse('http://10.188.238.250:6039/employees?idExploitation=1');
    var response = await http
        .post(api, body: body, headers: {'Content-Type': 'application/json'});
    print(response);
    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
