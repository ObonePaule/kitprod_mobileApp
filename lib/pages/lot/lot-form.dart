import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/models/lot.dart';
import 'package:kitprod/services/lot-service.dart';

class LotFormPage extends StatefulWidget {
  static const String routeName = "/lotform";

  @override
  _LotFormPageState createState() => _LotFormPageState();
}

class _LotFormPageState extends State<LotFormPage> {
  late Building building;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Building;
    setState(() {
      building = args;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un lot"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: lotNameController,
                  decoration: InputDecoration(
                      hintText: "Nom du lot", labelText: "Nom du lot"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lotSpeciesController,
                  decoration:
                      InputDecoration(hintText: "Espèce", labelText: "Espèce"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lotMepAgeController,
                  decoration: InputDecoration(
                      hintText: "Age MEP", labelText: "Age MEP"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lotCostByAnimalController,
                  decoration: InputDecoration(
                      hintText: "Coût par animal",
                      labelText: "Cout par animal"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lotNumberOfFemales,
                  decoration: InputDecoration(
                      hintText: "Nombre de femelles",
                      labelText: "Nombre de femelles"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lotCostOfLitterController,
                  decoration: InputDecoration(
                      hintText: "Coût litière", labelText: "Coût litière"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createLot(context);
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

  createLot(context) async {
    Lot? obj = Lot(
        name: lotNameController.text.trim(),
        species: buildingSpaceController.text.trim(),
        mepAge: int.tryParse(lotMepAgeController.text.trim()),
        costByAnimal: double.tryParse(lotCostByAnimalController.text.trim()),
        number: int.tryParse(lotNumberOfFemales.text.trim()),
        costOfLitter: double.tryParse(lotCostOfLitterController.text.trim()),
        lotSheet: null);
    //isArchived: bool)

    var body = jsonEncode(obj.toJson());

    var obj2 = await insertLot(building.id!, body);
    if (obj2 != null) {
      Navigator.pop(context);
    }
  }
}
