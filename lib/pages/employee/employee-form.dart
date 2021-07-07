import 'dart:convert';
//import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:kitprod/models/employee.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/services/employee-service.dart';

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
                  controller: employeeNameController,
                  decoration: InputDecoration(
                      hintText: "Nom de l'employé",
                      labelText: "Nom de l'employé"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: employeeNumberController,
                  decoration: InputDecoration(
                      hintText: "Nombre d'heures par an",
                      labelText: "Nombre d'heures par an"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: employeeCostController,
                  decoration: InputDecoration(
                      hintText: "Cout horaire", labelText: "Cout horaire"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Employee? obj = Employee(
                        hourCost:
                            double.tryParse(employeeCostController.text.trim()),
                        name: employeeNameController.text.trim(),
                        numberOfHour: double.tryParse(
                            employeeNumberController.text.trim()));
                    var body = jsonEncode(obj.toJson());

                    // print(body);
                    obj = await insertEmployeeTmp(body);
                    if (obj != null) {
                      Navigator.pop(context);
                    }
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
}
