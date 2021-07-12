import 'package:flutter/material.dart';
import 'package:kitprod/components/constants.dart';
import 'package:kitprod/pages/auth/authentication.dart';
import 'package:kitprod/pages/auth/signup.dart';

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
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Image.asset(
          //   "assets/back.jpg",
          //   fit: BoxFit.cover,
          //   color: Colors.grey.withOpacity(0.7),
          //   colorBlendMode: BlendMode.darken,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Bienvenue, Connectez-vous",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value!.isEmpty
                              ? "Entrez une adresse mail valide"
                              : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: "Adresse mail",
                              labelText: "Adresse mail")),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) => value!.length < 6
                            ? "Entrez un mot de passe à 6 caractères au moins"
                            : null,
                        decoration: textInputDecoration.copyWith(
                            hintText: "Mot de passe",
                            labelText: "Mot de passe"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var email = _usernameController.value.text;
                            var password = _passwordController.value.text;
                            //Firebase auth
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Entrez une adresse mail valide';
                              });
                            }
                          }
                        },
                        child: Text("Connexion"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          minimumSize: Size(350, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 180.0),
                        child: Text(
                          "Mot de passe oublié?",
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupPage.routeName);
                          },
                          child: Text("Creer un compte"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
