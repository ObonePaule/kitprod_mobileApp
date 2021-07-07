// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String _email, _password;
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(  
//       appBar: AppBar(title: Text('Login'),),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(  
//                 hintText: 'Email'
//               ),
//                onChanged: (value) {
//                 setState(() {
//                   _email = value.trim();
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               obscureText: true,
//               decoration: InputDecoration(hintText: 'Password'),
//               onChanged: (value) {
//                 setState(() {
//                   _password = value.trim();
//                 });
//               },
//             ),
            
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children:[
//             RaisedButton(
//               color: Theme.of(context).accentColor,
//               child: Text('Signin'),
//               onPressed: (){
//                   auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//                   });
                  
//             }),
//             RaisedButton( 
//               color: Theme.of(context).accentColor,
//               child: Text('Signup'),
//               onPressed: (){
//                 auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//                 });
                
//               },
//             )
//           ])
//         ],),
//     );
//   }
// }