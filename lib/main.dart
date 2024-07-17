import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kitprod/components/menu-exploitation.dart';
import 'package:kitprod/components/user.dart';
import 'package:kitprod/pages/auth/authentication.dart';
import 'package:kitprod/pages/auth/signin.dart';
import 'package:kitprod/pages/auth/signup.dart';
import 'package:kitprod/pages/auth/splash-screen-wrapper.dart';
import 'package:kitprod/pages/building/building-form.dart';
import 'package:kitprod/pages/building/building-list.dart';
import 'package:kitprod/pages/charge/charge-form.dart';
import 'package:kitprod/pages/charge/charge-list.dart';
import 'package:kitprod/pages/employee/employee-form.dart';
import 'package:kitprod/pages/employee/employee-list.dart';
import 'package:kitprod/pages/exploitation/exploitation-form.dart';
import 'package:kitprod/pages/fixedtask/fixedtask-form.dart';
import 'package:kitprod/pages/fixedtask/fixedtask-list.dart';
import 'package:kitprod/pages/food/food-form.dart';
import 'package:kitprod/pages/food/food-list.dart';
import 'package:kitprod/pages/lot/lot-form.dart';
import 'package:kitprod/pages/lot/lot-list.dart';
import 'package:kitprod/pages/lotSheet/lotsheet-form.dart';
import 'package:kitprod/pages/lotsheet/lotsheet-list.dart';
import 'package:kitprod/pages/rawmaterial/rawmaterial-form.dart';
import 'package:kitprod/pages/rawmaterial/rawmaterial-list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kitprod/utils/color.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenWrapper(),
        theme: ThemeData(
            primaryColor: CustomColors.brandingSecondaryGreen,
            scaffoldBackgroundColor: Colors.white,
            textSelectionTheme: Theme.of(context).textSelectionTheme.copyWith(
                cursorColor: CustomColors.brandingSecondaryGreen,
                selectionHandleColor: CustomColors.brandingSecondaryGreen),
            textTheme:
                Theme.of(context).textTheme.apply(fontFamily: "GilroyRegular")),
        routes: {
          SigninPage.routeName: (context) => SigninPage(),
          SignupPage.routeName: (context) => SignupPage(),
          EmployeeFormPage.routeName: (context) => EmployeeFormPage(),
          EmployeeListPage.routeName: (context) => EmployeeListPage(),
          BuildingListPage.routeName: (context) => BuildingListPage(),
          BuildingFormPage.routeName: (context) => BuildingFormPage(),
          LotFormPage.routeName: (context) => LotFormPage(),
          LotListPage.routeName: (context) => LotListPage(),
          LotSheetFormPage.routeName: (context) => LotSheetFormPage(),
          LotSheetListPage.routeName: (context) => LotSheetListPage(),
          ChargeFormPage.routeName: (context) => ChargeFormPage(),
          ChargeListPage.routeName: (context) => ChargeListPage(),
          FixedTaskFormPage.routeName: (context) => FixedTaskFormPage(),
          FixedTaskListPage.routeName: (context) => FixedTaskListPage(),
          FoodFormPage.routeName: (context) => FoodFormPage(),
          FoodListPage.routeName: (context) => FoodListPage(),
          RawMaterialFormPage.routeName: (context) => RawMaterialFormPage(),
          RawMaterialListPage.routeName: (context) => RawMaterialListPage(),
          MenuExploitationPage.routeName: (context) => MenuExploitationPage(),
          ExploitationFormPage.routeName: (context) => ExploitationFormPage()
        },
      ),
    );
  }
}
