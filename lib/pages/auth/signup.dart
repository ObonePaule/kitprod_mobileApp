import 'package:flutter/material.dart';
import 'package:kitprod/pages/auth/authentication.dart';

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
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      children: [
                        Text(
                          "Bienvenue, Inscrivez-vous",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                              value!.isEmpty ? "Entrez votre nom" : null,
                          decoration: InputDecoration(
                              hintText: "Nom eleveur",
                              labelText: "Nom eleveur"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value!.isEmpty
                              ? "Entrez une adresse mail valide"
                              : null,
                          decoration: InputDecoration(
                              hintText: "Adresse mail",
                              labelText: "Adresse mail"),
                        ),
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
                          decoration: InputDecoration(
                              hintText: "Mot de passe",
                              labelText: "Mot de passe"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var name = _nameController.value.text;
                              var email = _usernameController.value.text;
                              var password = _passwordController.value.text;

                              //Firebase auth
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      name, email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Entrez une adresse mail valide';
                                });
                              }
                            }
                          },
                          child: Text("Inscription"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
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
            ),
          ],
        ),
      ),
    );
  }
}
