import 'package:flutter/material.dart';
import 'package:kitprod/components/menu.dart';
import 'package:kitprod/components/user.dart';
import 'package:kitprod/pages/auth/signin.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return SigninPage();
    } else {
      return MenuPage();
    }
  }
}
