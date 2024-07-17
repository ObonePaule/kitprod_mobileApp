import 'package:flutter/material.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/models/lot.dart';
import 'package:kitprod/pages/lot/lot-form.dart';
import 'package:kitprod/pages/lotsheet/lotsheet-list.dart';
import 'package:kitprod/services/lot-service.dart';

class LotListPage extends StatefulWidget {
  static const String routeName = "/lotlist";

  @override
  _LotListPageState createState() => _LotListPageState();
}

class _LotListPageState extends State<LotListPage> {
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
    final args = ModalRoute.of(context)!.settings.arguments as Building;
    setState(() {
      building = args;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Lot en cours"),
      ),
      body: renderLotsBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderLotsBody() {
    return FutureBuilder<List<Lot>>(
      future: getLotList(building.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderLotsList(snapshot);
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return CircularProgressIndicator();
      },
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, LotFormPage.routeName,
                arguments: Building(id: building.id))
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  ListView renderLotsList(AsyncSnapshot<List<Lot>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child:
              Card(child: ListTile(title: Text(snapshot.data![index].name!))),
          onTap: () {
            Navigator.pushNamed(context, LotSheetListPage.routeName,
                arguments: {
                  'lot': Lot(id: snapshot.data![index].id),
                  'building': Building(id: building.id)
                });
          },
        );
      },
      itemCount: snapshot.data!.length,
    );
  }
}
