import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Paule Samantha"),
              accountEmail: Text("poboneengouang@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("assets/background.jpg"))),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Paule Samantha"),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
