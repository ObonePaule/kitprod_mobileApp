import 'dart:convert';
import 'package:kitprod/models/rawMaterial.dart';
import 'package:http/http.dart' as http;

final String host = '7df84e1d33e8.ngrok.io';
final String path = '/rawmaterials';

Future<List<RawMaterial>> getRawMaterialList(
    double idExploitation, double idFood) async {
  var params = {
    'idExploitation': idExploitation.toString(),
    'idBuilding': idFood.toString()
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable rawmaterialsJson = jsonDecode(response.body);
  List<RawMaterial> rawmaterials = List<RawMaterial>.from(
      rawmaterialsJson.map((modelAsJson) => RawMaterial.fromJson(modelAsJson)));

  return rawmaterials;
}

Future insertRawMaterial(
    double idExploitation, double idFood, String body) async {
  var params = {
    'idExploitation': idExploitation.toString(),
    'idFood': idFood.toString()
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

// RawMaterial.fromJson(json.decode(response.body))
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    return null;
  }
}
