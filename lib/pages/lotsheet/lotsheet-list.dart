import 'package:flutter/material.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/models/lot.dart';
import 'package:kitprod/models/lotSheet.dart';
import 'package:kitprod/pages/lotsheet/lotsheet-form.dart';
import 'package:kitprod/services/lotsheet-service.dart';

class LotSheetListPage extends StatefulWidget {
  static const String routeName = "/lotsheetlist";

  @override
  _LotSheetListPageState createState() => _LotSheetListPageState();
}

class _LotSheetListPageState extends State<LotSheetListPage> {
  late Lot lot;
  late Building building;

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
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    setState(() {
      lot = args['lot'];
      building = args['building'];
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Fiche de lot"),
      ),
      body: renderLotSheetsBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderLotSheetsBody() {
    return FutureBuilder<List<LotSheet>>(
      future: getLotSheetList("ghj", "lot.id!"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderLotSheetList(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, LotSheetFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: Column(children: [
        const Icon(Icons.add),
      ]),
    );
  }

  ListView renderLotSheetList(AsyncSnapshot<List<LotSheet>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(title: Text(snapshot.data![index].id.toString())));
      },
      itemCount: snapshot.data!.length,
    );
  }
}
