import 'package:flutter/material.dart';
import 'package:kitprod/models/charge.dart';
import 'package:kitprod/pages/charge/charge-form.dart';
import 'package:kitprod/services/charge-service.dart';

class ChargeListPage extends StatefulWidget {
  static const String routeName = "/chargelist";

  @override
  _ChargeListPageState createState() => _ChargeListPageState();
}

class _ChargeListPageState extends State<ChargeListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charges"),
      ),
      body: Card(child: renderChargesBody()),
      floatingActionButton: renderFloatingButton(context),
    );
  }

  FloatingActionButton renderFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, ChargeFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget renderChargesBody() {
    return FutureBuilder<List<Charge>>(
      future: getCharges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderChargesList(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  ListView renderChargesList(AsyncSnapshot<List<Charge>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(snapshot.data![index].chargeType),
            trailing: Text(snapshot.data![index].value.toString()));
      },
      itemCount: snapshot.data!.length,
    );
  }
}
