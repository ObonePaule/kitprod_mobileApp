import 'package:flutter/material.dart';
import 'package:kitprod/components/menu-exploitation.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Row(
            children: [Card()],
          ),
          ListView(children: [
            GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text("Guide d'utilisation"),
                  subtitle: Text("Informations sur l'application"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(""),
                  ),
                ),
              ),
            ),
            GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text("Exploitation"),
                    subtitle: Text(
                        "Batiments, Main d'oeuvre, Charges Temps de travail, Aliments, "),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(""),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MenuExploitationPage.routeName);
                }),
            GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text("Contacts et Liens"),
                  subtitle:
                      Text("Informations sur la chambre et ses partenaires"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(""),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text("Compte"),
                  subtitle: Text(
                      "Informations sur votre compte, Modifier compte, Reinitialisation"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(""),
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
