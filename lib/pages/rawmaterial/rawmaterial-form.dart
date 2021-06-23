import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/models/rawMaterial.dart';
import 'package:kitprod/services/rawmaterial-service.dart';

class RawMaterialFormPage extends StatelessWidget {
  static const String routeName = "/rawmaterialform";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une matière matière"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: rawNameController,
                  decoration:
                      InputDecoration(hintText: "Nom", labelText: "Nom"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: rawProportionController,
                  decoration: InputDecoration(
                      hintText: "Proportion en %",
                      labelText: "Proportion en %"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: rawMpPriceController,
                  decoration: InputDecoration(
                      hintText: "Prix MP en kg", labelText: "Prix MP en kg"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createRawMaterial(context);
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

  createRawMaterial(context) async {
    RawMaterial? obj = RawMaterial(
        name: rawNameController.text.trim(),
        proportion: double.tryParse(rawProportionController.text.trim()),
        mpPrice: double.tryParse(rawMpPriceController.text.trim()));

    var body = jsonEncode(obj.toJson());

    var obj2 = await insertRawMaterial(4.0, 4.0, body);
    print(obj2);
    Navigator.pop(context);
  }
}
