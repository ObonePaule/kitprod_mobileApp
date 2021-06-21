import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/models/food.dart';
import 'package:kitprod/services/food-service.dart';

class FoodFormPage extends StatelessWidget {
  static const String routeName = "/foodform";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un aliment"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: foodNameController,
                  decoration: InputDecoration(
                      hintText: "Nom du bâtiment",
                      labelText: "Nom du bâtiment"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createFood(context);
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

  createFood(context) async {
    Food? obj = Food(name: foodNameController.text.trim());
    var body = jsonEncode(obj.toJson());

    var obj2 = await insertFood(4.0, body);
    //print(obj2);
    if (obj2 != 0) {
      Navigator.pop(context);
    }
  }
}
