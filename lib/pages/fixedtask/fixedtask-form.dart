import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/models/fixedTask.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/services/fixedtask-service.dart';

class FixedTaskFormPage extends StatefulWidget {
  static const String routeName = "/fixedtaskform";

  @override
  _FixedTaskFormPageState createState() => _FixedTaskFormPageState();
}

class _FixedTaskFormPageState extends State<FixedTaskFormPage> {
  List<FixedTask> fixedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temps de travail"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: fixedNettoyageDesinfectionController,
                  decoration: InputDecoration(
                      hintText: "Nettoyage et Désinfection",
                      labelText: "Nettoyage et Désinfection"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fixedPreparationController,
                  decoration: InputDecoration(
                      hintText: "Préparation bâtiment",
                      labelText: "Préparation bâtiment"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fixedMepLotController,
                  decoration: InputDecoration(
                      hintText: "Mise en place de Lot",
                      labelText: "Mise en place de Lot"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fixedTempsEnlevementController,
                  decoration: InputDecoration(
                      hintText: "Temps d'enlèvement",
                      labelText: "Temps d'enlèvement"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fixedTacheAdminController,
                  decoration: InputDecoration(
                      hintText: "Tâches administratives",
                      labelText: "Tâches administratives"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fixedAutreController,
                  decoration:
                      InputDecoration(hintText: "Autre", labelText: "Autre"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createFixedTasks(context);
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

  createFixedTasks(context) async {
    FixedTask? cleaningAndDisinfection = FixedTask(
        fixedTaskType: "NETTOYAGE_DESINFECTION",
        value:
            double.tryParse(fixedNettoyageDesinfectionController.text.trim()));
    FixedTask? buildPreparation = FixedTask(
        fixedTaskType: "PREPARATION_BATIMENT",
        value: double.tryParse(fixedPreparationController.text.trim()));
    FixedTask? mepLot = FixedTask(
        fixedTaskType: "MEP_LOT",
        value: double.tryParse(fixedMepLotController.text.trim()));
    FixedTask? removalTime = FixedTask(
        fixedTaskType: "TEMPS_ENLEVEMENT",
        value: double.tryParse(fixedTempsEnlevementController.text.trim()));
    FixedTask? administrativeTasks = FixedTask(
        fixedTaskType: "TACHES_ADMINISTRATIVES",
        value: double.tryParse(fixedTacheAdminController.text.trim()));
    FixedTask? other = FixedTask(
        fixedTaskType: "AUTRE",
        value: double.tryParse(fixedAutreController.text.trim()));
    fixedTasks.addAll([
      cleaningAndDisinfection,
      buildPreparation,
      mepLot,
      removalTime,
      administrativeTasks,
      other
    ]);
    var body = jsonEncode(fixedTasks);

    print(body);
    var insertedTask = await insertTask(4.0, body);
    if (insertedTask != null) {
      Navigator.pop(context);
    }
  }
}
