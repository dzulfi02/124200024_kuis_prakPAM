import 'package:flutter/material.dart';
import 'package:kuis_prakpam_124200024/model/groceries.dart';
import 'package:kuis_prakpam_124200024/detail_belanjaan.dart';

class DaftarBelanjaan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groceries"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          if (constraint.maxWidth <= 600) {
            return GroceriesList();
          } else if (constraint.maxWidth <= 300) {
            return GroceriesGrid(gridCount: 1);
          } else {
            return GroceriesGrid(gridCount: 2);
          }
        },
      ),
    );
  }
}

class GroceriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Groceries place = groceryList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailBelanjaan(place: place);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(flex: 1, child: Image.network(place.productUrl)),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.storeName)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
      itemCount: groceryList.length,
    );
  }
}

class GroceriesGrid extends StatelessWidget {
  final int gridCount;

  GroceriesGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: GridView.count(
            crossAxisCount: gridCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: groceryList.map((place) => InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return DetailBelanjaan(place: place);
                    }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                          place.productImageUrls[0],
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        place.name,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(place.storeName),
                    )
                  ],
                ),
              ),
            ))
                .toList(),
          ),
        ));
  }
}
