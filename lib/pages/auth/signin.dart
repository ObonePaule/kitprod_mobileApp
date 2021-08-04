import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kitprod/components/menu.dart';
import 'package:kitprod/components/text-input-field.dart';
import 'package:kitprod/components/user.dart';
import 'package:kitprod/pages/auth/authentication.dart';
import 'package:kitprod/components/elevated-button.dart';
import 'package:kitprod/components/text-button.dart';
import 'package:kitprod/pages/auth/signup.dart';
import 'package:kitprod/utils/color.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = "Signin";

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                  "Bienvenue,\nConnectez-vous.",
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
                    "assets/images/signin.png",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textButton("Mot de passe oublié ?"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    elevatedButton("Se connecter", onPress: signin),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textButton("Créer un nouveau compte", onPress: () {
                          Navigator.pushNamed(context, SignupPage.routeName);
                        }),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signin() async {
    if (_formKey.currentState!.validate()) {
      var email = _usernameController.value.text;
      var password = _passwordController.value.text;
      //Firebase auth
      AppUser? appUser =
          await _auth.signInWithEmailAndPassword(email, password);

      if (appUser == null) {
        setState(() {
          error = 'Entrez une adresse mail valide';
        });
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MenuPage()));
      }
    }
  }
}
