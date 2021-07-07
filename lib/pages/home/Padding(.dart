// Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               child: Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         "Bienvenue, Connectez-vous",
//                         style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blueGrey),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       TextFormField(
//                           controller: _usernameController,
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (value) => value!.isEmpty
//                               ? "Entrez une adresse mail valide"
//                               : null,
//                           decoration: textInputDecoration.copyWith(
//                               hintText: "Adresse mail",
//                               labelText: "Adresse mail")),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         controller: _passwordController,
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                         validator: (value) => value!.length < 6
//                             ? "Entrez un mot de passe à 6 caractères au moins"
//                             : null,
//                         decoration: textInputDecoration.copyWith(
//                             hintText: "Mot de passe",
//                             labelText: "Mot de passe"),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "Mot de passe oublié?",
//                         textAlign: TextAlign.end,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             var email = usernameController.value.text;
//                             var password = passwordController.value.text;
//                             //Firebase auth
//                             dynamic result = await _auth
//                                 .signInWithEmailAndPassword(email, password);
//                             if (result == null) {
//                               setState(() {
//                                 error = 'Entrez une adresse mail valide';
//                               });
//                             }
//                           }

//                           Navigator.pushNamed(context, HomePage.routeName);
//                         },
//                         child: Text("Connexion"),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.teal,
//                           minimumSize: Size(350, 50),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4.0)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),