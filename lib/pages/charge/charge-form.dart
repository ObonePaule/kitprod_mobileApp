import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kitprod/components/controllers.dart';
import 'package:kitprod/models/charge.dart';
import 'package:kitprod/services/charge-service.dart';

class ChargeFormPage extends StatefulWidget {
  static const String routeName = "/chargeform";

  @override
  _ChargeFormPageState createState() => _ChargeFormPageState();
}

class _ChargeFormPageState extends State<ChargeFormPage> {
  List<Charge> charges = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charges"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: chargeAssuranceController,
                  decoration: InputDecoration(hintText: "Assurance"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeMecanisationController,
                  decoration: InputDecoration(hintText: "Mécanisation"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeFraisDeGestionController,
                  decoration: InputDecoration(hintText: "Frais de gestion"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteEquipementController,
                  decoration:
                      InputDecoration(hintText: "Annuité équipements avicoles"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteBatimentController,
                  decoration: InputDecoration(hintText: "Annuité bâtiment"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteFafController,
                  decoration: InputDecoration(hintText: "Annuité FAF"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeEntretienCourantController,
                  decoration: InputDecoration(
                      hintText: "Entretien courant et petit matériel"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAutreController,
                  decoration: InputDecoration(hintText: "Autre"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () {
                    createCharges(context);
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

  createCharges(context) async {
    Charge? assurance = Charge(
        chargeType: "ASSURANCE",
        value: double.tryParse(chargeAssuranceController.text.trim()));
    Charge? mecanisation = Charge(
        chargeType: "MECANISATION",
        value: double.tryParse(chargeMecanisationController.text.trim()));
    Charge? fraisDeGestion = Charge(
        chargeType: "FRAIS_DE_GESTION",
        value: double.tryParse(chargeMecanisationController.text.trim()));
    Charge? annuiteEquipement = Charge(
        chargeType: "ANNUITE_EQUIPEMENTS_AVICOLES",
        value: double.tryParse(chargeAnnuiteEquipementController.text.trim()));
    Charge? annuiteBatiment = Charge(
        chargeType: "ANNUITE_BATIMENT",
        value: double.tryParse(chargeAnnuiteBatimentController.text.trim()));
    Charge? annuiteFaf = Charge(
        chargeType: "ANNUITE_FAF",
        value: double.tryParse(chargeAnnuiteFafController.text.trim()));
    Charge? entretienCourant = Charge(
        chargeType: "ENTRETIEN_COURANT_PETIT_MATERIEL",
        value: double.tryParse(chargeEntretienCourantController.text.trim()));
    Charge? autre = Charge(
        chargeType: "AUTRE",
        value: double.tryParse(chargeAutreController.text.trim()));
    charges.addAll([
      assurance,
      mecanisation,
      fraisDeGestion,
      annuiteEquipement,
      annuiteBatiment,
      annuiteFaf,
      entretienCourant,
      autre
    ]);
    var body = jsonEncode(charges);
    var insertedCharges = await insertCharges(body);
    if (insertedCharges != null) {
      Navigator.pop(context);
    }
  }
}
