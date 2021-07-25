import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kitprod/components/elevated-button.dart';
import 'package:kitprod/components/text-button.dart';
import 'package:kitprod/components/text-input-field.dart';
import 'package:kitprod/components/user.dart';
import 'package:kitprod/pages/auth/authentication.dart';
import 'package:kitprod/pages/auth/signin.dart';
import 'package:kitprod/services/user-service.dart';
import 'package:kitprod/utils/color.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = "signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  String error = '';

  @override
  void initState() {
    // Pour mettre la page en plein écran
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bonjour,\nInscrivez-vous.",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: "GilroySemiBold",
                      color: CustomColors.brandingGreenDark,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/signup.png",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    formInputControl(
                        label: "Nom complet",
                        hintText: "ex: Jean Lemiel",
                        icon: Ionicons.person_circle,
                        inputType: TextInputType.name,
                        controller: _nameController),
                    SizedBox(
                      height: 25,
                    ),
                    formInputControl(
                        label: "Adresse email",
                        hintText: "ex: jean.lemiel@exemple.xyz",
                        icon: Ionicons.mail_open,
                        inputType: TextInputType.emailAddress,
                        controller: _usernameController),
                    SizedBox(
                      height: 20,
                    ),
                    formInputControl(
                        label: "Mot de passe",
                        hintText: "unmotdepassefort",
                        icon: Ionicons.key,
                        obscureText: true,
                        inputType: TextInputType.text,
                        controller: _passwordController),
                    SizedBox(
                      height: 25,
                    ),
                    elevatedButton("Créer mon compte", onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        var name = _nameController.value.text;
                        var email = _usernameController.value.text;
                        var password = _passwordController.value.text;

                        // Firebase auth
                        AppUser? appUser =
                            await _auth.registerWithEmailAndPassword(
                                name, email, password);

                        if (appUser == null) {
                          setState(() {
                            error = 'Entrez une adresse mail valide';
                          });
                        } else {
                          appUser.fullName = name;
                          appUser.email = email;

                          var body = jsonEncode(appUser.toJson());
                          var insertedUser = await insertUser(body);

                          if (insertedUser != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SigninPage()));
                          }
                        }
                      }
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textButton("Se connecter à un compte", onPress: () {
                          Navigator.pushNamed(context, SigninPage.routeName);
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
