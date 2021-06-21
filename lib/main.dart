import 'package:flutter/material.dart';
import 'package:kitprod/components/menu-exploitation.dart';
//import 'package:kitprod/components/menu-exploitation.dart';
import 'package:kitprod/pages/auth/signin.dart';
import 'package:kitprod/pages/building/building-form.dart';
import 'package:kitprod/pages/building/building-list.dart';
import 'package:kitprod/pages/charge/charge-form.dart';
import 'package:kitprod/pages/charge/charge-list.dart';
// import 'package:kitprod/pages/building/building-form.dart';
// import 'package:kitprod/pages/building/building-list.dart';
// import 'package:kitprod/pages/charge/charge-form.dart';
// import 'package:kitprod/pages/charge/charge-list.dart';
import 'package:kitprod/pages/employee/employee-form.dart';
import 'package:kitprod/pages/employee/employee-list.dart';
import 'package:kitprod/pages/fixedtask/fixedtask-form.dart';
import 'package:kitprod/pages/fixedtask/fixedtask-list.dart';
import 'package:kitprod/pages/food/food-form.dart';
import 'package:kitprod/pages/food/food-list.dart';
import 'package:kitprod/pages/home.dart';
import 'package:kitprod/pages/lot/lot-form.dart';
import 'package:kitprod/pages/lot/lot-list.dart';
import 'package:kitprod/pages/lotSheet/lotsheet-form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuExploitationPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        SigninPage.routeName: (context) => SigninPage(),
        HomePage.routeName: (context) => HomePage(),
        EmployeeFormPage.routeName: (context) => EmployeeFormPage(),
        EmployeeListPage.routeName: (context) => EmployeeListPage(),
        BuildingListPage.routeName: (context) => BuildingListPage(),
        BuildingFormPage.routeName: (context) => BuildingFormPage(),
        LotFormPage.routeName: (context) => LotFormPage(),
        LotListPage.routeName: (context) => LotListPage(),
        LotSheetFormPage.routeName: (context) => LotSheetFormPage(),
        ChargeFormPage.routeName: (context) => ChargeFormPage(),
        ChargeListPage.routeName: (context) => ChargeListPage(),
        FixedTaskFormPage.routeName: (context) => FixedTaskFormPage(),
        FixedTaskListPage.routeName: (context) => FixedTaskListPage(),
        FoodFormPage.routeName: (context) => FoodFormPage(),
        FoodListPage.routeName: (context) => FoodListPage()
      },
    );
  }
}
