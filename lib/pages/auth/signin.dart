import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kitprod/components/constants.dart';
import 'package:kitprod/components/text-input-field.dart';
import 'package:kitprod/pages/auth/authentication.dart';
import 'package:kitprod/pages/auth/signup.dart';
import 'package:kitprod/utils/color.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = " Signin";

  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  String error = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pour mettre la page en plein écran
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenue,\nConnectez-vous.",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "GilroySemiBold",
                  fontWeight: FontWeight.w900),
            ),
            Image.asset("assets/images/login.png"),
            Card(
              elevation: 0,
              child: Column(
                children: [
                  TextInputField(
                    label: "Adresse email",
                    hintText: "ex: jean.lemiel@exemple.xyz",
                    suffixIcon: Ionicons.mail_open_outline,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                    label: "Mot de passe",
                    hintText: "unmotdepassefort",
                    suffixIcon: Ionicons.key_outline,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "SE CONNECTER",
                      style: TextStyle(fontSize: 18, fontFamily: "GilroyBold"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      minimumSize: Size(double.infinity,
                          30), // double.infinity is the width and 30 is the height
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
