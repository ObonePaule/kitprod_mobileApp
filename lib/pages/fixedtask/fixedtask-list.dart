//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/models/fixedTask.dart';
import 'package:kitprod/pages/fixedtask/fixedtask-form.dart';
import 'package:kitprod/services/fixedtask-service.dart';

class FixedTaskListPage extends StatefulWidget {
  static const String routeName = "/fixedtasklist";

  @override
  _FixedTaskListPageState createState() => _FixedTaskListPageState();
}

class _FixedTaskListPageState extends State<FixedTaskListPage> {
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
        title: Text("Temps de travail"),
      ),
      body: Card(child: renderTasksBody()),
      floatingActionButton: renderFloatingButton(context),
    );
  }

  FloatingActionButton renderFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, FixedTaskFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget renderTasksBody() {
    return FutureBuilder<List<FixedTask>>(
      future: getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderTasksList(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  ListView renderTasksList(AsyncSnapshot<List<FixedTask>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(snapshot.data![index].fixedTaskType),
            trailing: Text(snapshot.data![index].value.toString()));
      },
      itemCount: snapshot.data!.length,
    );
  }
}
