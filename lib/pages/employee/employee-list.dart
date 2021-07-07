import 'package:flutter/material.dart';
import 'package:kitprod/models/employee.dart';
import 'package:kitprod/pages/employee/employee-form.dart';
import 'package:kitprod/services/employee-service.dart';

class EmployeeListPage extends StatefulWidget {
  static const String routeName = "/employee";
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main-d'oeuvre"),
      ),
      body: renderEmployeesBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderEmployeesBody() {
    return FutureBuilder<List<Employee>>(
      future: getEmployeeList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderEmployeesList(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, EmployeeFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  ListView renderEmployeesList(AsyncSnapshot<List<Employee>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(child: ListTile(title: Text(snapshot.data![index].name)));
      },
      itemCount: snapshot.data!.length,
    );
  }
}
