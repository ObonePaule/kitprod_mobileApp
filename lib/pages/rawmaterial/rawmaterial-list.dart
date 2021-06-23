import 'package:flutter/material.dart';
import 'package:kitprod/models/rawMaterial.dart';
import 'package:kitprod/pages/rawmaterial/rawmaterial-form.dart';
import 'package:kitprod/services/rawmaterial-service.dart';

class RawMaterialListPage extends StatefulWidget {
  static const String routeName = "/rawmateriallist";

  @override
  _RawMaterialListPageState createState() => _RawMaterialListPageState();
}

class _RawMaterialListPageState extends State<RawMaterialListPage> {
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
        title: Text("Ajouter une matière première"),
      ),
      body: renderRawMaterialsBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderRawMaterialsBody() {
    return FutureBuilder<List<RawMaterial>>(
      future: getRawMaterialList(4.0, 4.0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderRawMaterialList(snapshot);
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

//Pas de retour en arriere. Page vide avec ajout de fiche de lot
  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RawMaterialFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  ListView renderRawMaterialList(AsyncSnapshot<List<RawMaterial>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(child: ListTile(title: Text(snapshot.data![index].name))),
          onTap: () {},
        );
      },
      itemCount: snapshot.data!.length,
    );
  }
}
