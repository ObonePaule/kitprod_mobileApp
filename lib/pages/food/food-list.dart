import 'package:flutter/material.dart';
import 'package:kitprod/models/food.dart';
import 'package:kitprod/pages/food/food-form.dart';
import 'package:kitprod/services/food-service.dart';

class FoodListPage extends StatefulWidget {
  static const String routeName = "/foodlist";

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
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
        title: Text("Aliments"),
      ),
      body: renderFoodBody(),
      floatingActionButton: renderFloatingActionButton(context),
    );
  }

  Widget renderFoodBody() {
    return FutureBuilder<List<Food>>(
      future: getFoodList(4.0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return renderFoodList(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  FloatingActionButton renderFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, FoodFormPage.routeName)
            .then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  ListView renderFoodList(AsyncSnapshot<List<Food>> snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(child: ListTile(title: Text(snapshot.data![index].name)));
      },
      itemCount: snapshot.data!.length,
    );
  }
}
