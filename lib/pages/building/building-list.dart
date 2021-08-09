import 'package:flutter/material.dart';
import 'package:kitprod/models/building.dart';
import 'package:kitprod/pages/building/building-form.dart';
import 'package:kitprod/pages/lot/lot-list.dart';
import 'package:kitprod/services/building-service.dart';

class BuildingListPage extends StatefulWidget {
  static const String routeName = "/buildinglist";

  @override
  _BuildingListPageState createState() => _BuildingListPageState();
}

class _BuildingListPageState extends State<BuildingListPage> {
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
        title: Text("Batiments"),
      ),
      body: renderBuildingBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderBuildingBody() {
    return FutureBuilder<List<Building>>(
      future: getBuildingList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderBuildingList(snapshot);
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
        Navigator.pushNamed(context, BuildingFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  ListView renderBuildingList(AsyncSnapshot<List<Building>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
            child:
                Card(child: ListTile(title: Text(snapshot.data![index].name!))),
            onTap: () {
              Navigator.pushNamed(context, LotListPage.routeName,
                  arguments: Building(
                      name: snapshot.data![index].name,
                      id: snapshot.data![index].id));
            });
      },
      itemCount: snapshot.data!.length,
    );
  }
}
