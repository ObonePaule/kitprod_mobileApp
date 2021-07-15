import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kitprod/components/text-input-field.dart';
import 'package:kitprod/pages/auth/authentication.dart';
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
    // Pour mettre la page en plein écran
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

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
                    controller: _usernameController
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  formInputControl(
                      label: "Mot de passe",
                      hintText: "unmotdepassefort",
                      icon: Ionicons.key,
                      obscureText: true,
                      inputType: TextInputType.text),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(fontFamily: "GilroySemiBold"),
                        ),
                        style: TextButton.styleFrom(
                            primary: CustomColors.brandingSecondaryGreen),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "SE CONNECTER",
                      style: TextStyle(fontSize: 16, fontFamily: "GilroyBold"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.brandingGreenDark,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      minimumSize: Size(double.infinity, 30),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: Text(
                          "Créer un nouveau compte",
                          style: TextStyle(fontFamily: "GilroySemiBold"),
                        ),
                        style: TextButton.styleFrom(
                            primary: CustomColors.brandingSecondaryGreen),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
