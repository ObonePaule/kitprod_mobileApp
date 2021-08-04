import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/services/building-service.dart';

class BuildingFormPage extends StatefulWidget {
  static const String routeName = "/buildingform";

  @override
  _BuildingFormPageState createState() => _BuildingFormPageState();
}

class _BuildingFormPageState extends State<BuildingFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un bâtiment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: buildingNameController,
                  decoration: InputDecoration(
                      hintText: "Nom du bâtiment",
                      labelText: "Nom du bâtiment"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: buildingSpaceController,
                  decoration: InputDecoration(
                      hintText: "Surface en m2", labelText: "Surface en m2"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: buildingNumberOfLotsController,
                  decoration: InputDecoration(
                      hintText: "Nombre de lots par an",
                      labelText: "Nombre de lots par an"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createBuilding(context);
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

  Future createBuilding(context) async {
    Building? building = Building(
        name: buildingNameController.text.trim(),
        surface: int.tryParse(buildingSpaceController.text.trim()),
        numberOfLots: int.tryParse(buildingNumberOfLotsController.text.trim()),
        lots: []);
    var body = jsonEncode(building.toJson());

    var insertedBuilding = await insertBuilding(body);
    if (insertedBuilding != null) {
      Navigator.pop(context);
    }
  }
}
