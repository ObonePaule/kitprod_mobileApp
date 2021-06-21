import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kitprod/models/food.dart';

final String host = 'b72b29b92f09.ngrok.io';
final String path = '/foods';

Future<List<Food>> getFoodList(double idExploitation) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.get(Uri.https(host, path, params));
  Iterable foodsJson = jsonDecode(response.body);
  List<Food> foods = List<Food>.from(
      foodsJson.map((modelAsJson) => Food.fromJson(modelAsJson)));

  return foods;
}

Future<int> insertFood(double idExploitation, String body) async {
  var params = {
    'idExploitation': idExploitation.toString(),
  };
  var response = await http.post(Uri.https(host, path, params),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
  //print(Food.fromJson(json.decode(response.body)));
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    return 0;
  }
}
