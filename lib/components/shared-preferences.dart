import 'package:kitprod/models/exploitation.dart';
import 'package:shared_preferences/shared_preferences.dart';

setCurrentExploitation(Exploitation exploitation) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("idExploitation", exploitation.id!);
}

Future<String> getCurrentExploitationId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idExploitation = prefs.getString("idExploitation")!;
  return idExploitation;
}
