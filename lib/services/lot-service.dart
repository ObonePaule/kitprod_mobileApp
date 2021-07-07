import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kitprod/components/shared-preferences.dart';
import 'dart:convert';
import 'package:kitprod/models/lot.dart';

final String host = dotenv.env['API_URL']!;
final String path = '/lots';

Future<List<Lot>> getLotList(String idBuilding) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {
    'idExploitation': idExploitation.toString(),
    'idBuilding': idBuilding.toString()
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable lotsJson = jsonDecode(response.body);
  List<Lot> lots =
      List<Lot>.from(lotsJson.map((modelAsJson) => Lot.fromJson(modelAsJson)));

  return lots;
}

Future<Lot?> insertLot(String idBuilding, String body) async {
  String idExploitation = await getCurrentExploitationId();
  var params = {'idExploitation': idExploitation, 'idBuilding': idBuilding};
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (response.statusCode == 200) {
    return Lot.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
