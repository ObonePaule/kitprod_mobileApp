import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:kitprod/components/elevated-button.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/models/lot.dart';
import 'package:kitprod/models/lotSheet.dart';
import 'package:kitprod/models/removal.dart';
import 'package:kitprod/services/food-service.dart';
import 'package:kitprod/services/lotsheet-service.dart';
import 'package:kitprod/utils/color.dart';

class LotSheetFormPage extends StatefulWidget {
  static const String routeName = "/lotsheetform";

  @override
  _LotSheetFormPageState createState() => _LotSheetFormPageState();
}

class _LotSheetFormPageState extends State<LotSheetFormPage> {
  late Building building;
  late Lot lot;

  final _formKey = GlobalKey<FormBuilderState>();
  final _poidsvifkey = GlobalKey<FormBuilderFieldState>();
  final _typealimentkey = GlobalKey<FormBuilderFieldState>();
  var _datecontroller = new TextEditingController();
  var _lostcontroller = new TextEditingController();
  var _quantitycontroller = new TextEditingController();
  var _complementcontroller = new TextEditingController();
  var _tempsalimentationsurveillancecontroller = new TextEditingController();
  var _tempsfabricationalimentcontroller = new TextEditingController();
  var _vaccincontroller = new TextEditingController();
  var _fraisveterinairescontroller = new TextEditingController();
  var _numberOfMalesController = new TextEditingController();
  var _numberOfFemalesController = new TextEditingController();
  var _numberOfAllComersController = new TextEditingController();
  var _weightByAllComersController = new TextEditingController();
  var _weightByMaleController = new TextEditingController();
  var _weightByFemaleController = new TextEditingController();

  var _coefcontroller = new TextEditingController();
  bool switched = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    setState(() {
      lot = args['lot'];
      building = args['building'];
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une fiche de lot"),
        backgroundColor: CustomColors.brandingGreenDark,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderDateTimePicker(
                  controller: _datecontroller,
                  name: "Date",
                  inputType: InputType.date,
                  format: DateFormat("yyyy-MM-dd"),
                  decoration:
                      InputDecoration(labelText: "Selectionner une date"),
                ),
                TextFormField(
                  controller: _lostcontroller,
                  decoration:
                      InputDecoration(hintText: "Perte", labelText: "Perte"),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: FutureBuilder<List<String>>(
                            future: getFoods(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return FormBuilderDropdown(
                                  key: _typealimentkey,
                                  hint: Text("Type d'aliment"),
                                  name: "aliment",
                                  items: transformList(snapshot.data!),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            }),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextFormField(
                          controller: _quantitycontroller,
                          decoration: InputDecoration(hintText: "Quantité"),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _complementcontroller,
                  decoration: InputDecoration(
                      hintText: "Complément aliment",
                      labelText: "Complément aliment"),
                ),
                TextFormField(
                  controller: _tempsalimentationsurveillancecontroller,
                  decoration: InputDecoration(
                      hintText: "Temps alimentation et surveillance",
                      labelText: "Temps alimentation et surveillance"),
                ),
                TextFormField(
                  controller: _tempsfabricationalimentcontroller,
                  decoration: InputDecoration(
                      hintText: "Temps fabrication de l'aliment",
                      labelText: "Temps fabrication de l'aliment"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Evenement particulier",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
                TextFormField(
                  controller: _vaccincontroller,
                  decoration:
                      InputDecoration(hintText: "Vaccin", labelText: "Vaccin"),
                ),
                TextFormField(
                  controller: _fraisveterinairescontroller,
                  decoration: InputDecoration(
                      hintText: "Frais vétérinaires",
                      labelText: "Frais vétérinaires"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Enlèvement",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Column(children: [
                        TextFormField(
                          controller: _numberOfMalesController,
                          decoration: InputDecoration(
                              hintText: "Nombres de mâles",
                              labelText: "Nombres de mâles"),
                        ),
                        TextFormField(
                          controller: _numberOfFemalesController,
                          decoration: InputDecoration(
                              hintText: "Nombres de femelles",
                              labelText: "Nombres de femelles"),
                        ),
                        TextFormField(
                          controller: _numberOfAllComersController,
                          decoration: InputDecoration(
                              hintText: "Nombres de TV",
                              labelText: "Nombres de TV"),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(children: [
                        TextFormField(
                          controller: _weightByMaleController,
                          decoration: InputDecoration(
                              hintText: "Poids par animal",
                              labelText: "Poids par animal"),
                        ),
                        TextFormField(
                          controller: _weightByFemaleController,
                          decoration: InputDecoration(
                              hintText: "Poids par animal",
                              labelText: "Poids par animal"),
                        ),
                        TextFormField(
                          controller: _weightByAllComersController,
                          decoration: InputDecoration(
                              hintText: "Poids par animal",
                              labelText: "Poids par animal"),
                        ),
                      ]),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderSwitch(
                          key: _poidsvifkey,
                          name: "poids vif",
                          title: Text("Poids mort"),
                          initialValue: switched,
                          decoration:
                              InputDecoration(enabledBorder: InputBorder.none),
                          onChanged: ((bool) => {
                                setState(() {
                                  switched = bool!;
                                })
                              })),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: (switched) ? TextFormField(
                        controller: _coefcontroller,
                        decoration: InputDecoration(
                            hintText: "Coef", labelText: "Coef"),
                      ) : SizedBox(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                elevatedButton("Enregistrer", onPress: () {
                  createLotSheet(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<DropdownMenuItem> transformList(List<Food> items) {
  //   return items.map((Food item) {
  //     String name = item.name;
  //     return DropdownMenuItem<String>(child: Text(name), value: item.id);
  //   }).toList();
  // }

  List<DropdownMenuItem> transformList(List<String> items) {
    return items.map((String item) {
      return DropdownMenuItem<String>(child: Text(item), value: item);
    }).toList();
  }

  createLotSheet(context) async {
    LotSheet? lotSheet = LotSheet(
        dateDebut: DateTime.parse(_datecontroller.text.trim()),
        loss: int.tryParse(_lostcontroller.text.trim()),
        dailyFood: DailyFood(type:_typealimentkey.currentState.toString(), value: double.tryParse(_quantitycontroller.text.trim()))
        complement: _complementcontroller.text.trim(),
        feedingAndCareTime:
            double.tryParse(_tempsalimentationsurveillancecontroller.text),
        manufacturingTime:
            double.tryParse(_tempsfabricationalimentcontroller.text),
        specialEvent: SpecialEvent(
            vaccin: double.tryParse(_vaccincontroller.text.trim()),
            fraisVeterinaires:
                double.tryParse(_fraisveterinairescontroller.text.trim())),
        removal: Removal(
            numberOfMales: int.tryParse(_numberOfMalesController.text.trim()),
            numberOfFemales:
                int.tryParse(_numberOfFemalesController.text.trim()),
            numberOfAllComers:
                int.tryParse(_numberOfAllComersController.text.trim()),
            weightByMale: double.tryParse(_weightByMaleController.text.trim()),
            weightByFemale:
                double.tryParse(_weightByFemaleController.text.trim()),
            weightByAllComers:
                double.tryParse(_weightByAllComersController.text.trim()),
            deadWeightCoef: double.tryParse(_coefcontroller.text.trim()))
        );

    print(lotSheet.toJson());
    var body = jsonEncode(lotSheet.toJson());

    var insertedLotSheet = await insertLotSheet(building.id!, lot.id!, body);
    //print(insertedLotSheet);
    if (insertedLotSheet != null) {
      Navigator.pop(context);
    }
    return "erreur";
  }
}
