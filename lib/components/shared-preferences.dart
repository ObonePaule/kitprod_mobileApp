// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kitprod/components/user.dart';
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

// setCurrentUser(AppUser user) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final FirebaseAuth user = await _auth.currentUser();
//   final idUser =
//   await prefs.setString("idUser", user.);
// }

Future<String> getCurrentUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String idUser = prefs.getString("idUser")!;
  return idUser;
}
