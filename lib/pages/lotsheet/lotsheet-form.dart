import 'package:flutter/material.dart';
//import 'package:kitprod/components/elevated-button-save.dart';

class LotSheetFormPage extends StatefulWidget {
  static const String routeName = "/lotsheetform";

  @override
  _LotSheetFormPageState createState() => _LotSheetFormPageState();
}

class _LotSheetFormPageState extends State<LotSheetFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une fiche de lot"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Nom du bâtiment",
                      labelText: "Nom du bâtiment"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration:
                      InputDecoration(hintText: "Perte", labelText: "Perte"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Quantité", labelText: "Quantité"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Complément", labelText: "Complément"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Temps( Alimentation + Surveillance)",
                      labelText: "Temps( Alimentation + Surveillance)"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Temps( Fabrication aliment)",
                      labelText: "Temps( Fabrication aliment)"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Enlevement", labelText: "Enlevement"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Nombre de males",
                      labelText: "Nombre de males"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Nombre de femelles",
                      labelText: "Nombre de femelles"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Nombre de TV", labelText: "Nombre de TV"),
                ),
                SizedBox(
                  height: 400,
                ),
                //ElevatedButtonSave(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
