import 'package:flutter/material.dart';
import 'package:kitprod/pages/employee_form_page.dart';

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main d'oeuvre"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EmployeeFormPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
