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
                  decoration: InputDecoration(hintText: "ASSURANCE"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeMecanisationController,
                  decoration: InputDecoration(hintText: "MECANISATION"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeFraisDeGestionController,
                  decoration: InputDecoration(hintText: "FRAIS_DE_GESTION"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteEquipementController,
                  decoration:
                      InputDecoration(hintText: "ANNUITE_EQUIPEMENTS_AVICOLES"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteBatimentController,
                  decoration: InputDecoration(hintText: "ANNUITE_BATIMENT"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAnnuiteFafController,
                  decoration: InputDecoration(hintText: "ANNUITE_FAF"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeEntretienCourantController,
                  decoration: InputDecoration(
                      hintText: "ENTRETIEN_COURANT_PETIT_MATERIEL"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: chargeAutreController,
                  decoration: InputDecoration(hintText: "AUTRE"),
                ),
                SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Charge? assurance = Charge(
                        chargeType: "ASSURANCE",
                        value: double.tryParse(
                            chargeAssuranceController.text.trim()));
                    Charge? mecanisation = Charge(
                        chargeType: "MECANISATION",
                        value: double.tryParse(
                            chargeMecanisationController.text.trim()));
                    Charge? fraisDeGestion = Charge(
                        chargeType: "FRAIS_DE_GESTION",
                        value: double.tryParse(
                            chargeMecanisationController.text.trim()));
                    Charge? annuiteEquipement = Charge(
                        chargeType: "ANNUITE_EQUIPEMENTS_AVICOLES",
                        value: double.tryParse(
                            chargeAnnuiteEquipementController.text.trim()));
                    Charge? annuiteBatiment = Charge(
                        chargeType: "ANNUITE_BATIMENT",
                        value: double.tryParse(
                            chargeAnnuiteBatimentController.text.trim()));
                    Charge? annuiteFaf = Charge(
                        chargeType: "ANNUITE_FAF",
                        value: double.tryParse(
                            chargeAnnuiteFafController.text.trim()));
                    Charge? entretienCourant = Charge(
                        chargeType: "ENTRETIEN_COURANT_PETIT_MATERIEL",
                        value: double.tryParse(
                            chargeEntretienCourantController.text.trim()));
                    Charge? autre = Charge(
                        chargeType: "AUTRE",
                        value:
                            double.tryParse(chargeAutreController.text.trim()));
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

                    print(body);
                    var insertedCharges = await insertCharges(4.0, body);
                    if (insertedCharges != null) {
                      Navigator.pop(context);
                    }
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
}
