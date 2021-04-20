import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Bienvenue cher eleveur!',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.start,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Adresse mail',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Mot de passe',
              ),
            ),
            ElevatedButton(
              child: Text('Valider'),
              onPressed: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
