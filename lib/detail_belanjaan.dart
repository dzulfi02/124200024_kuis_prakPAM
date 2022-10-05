import 'package:flutter/material.dart';
import 'package:kuis_prakpam_124200024/model/groceries.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailBelanjaan extends StatelessWidget {
  final Groceries place;

  DetailBelanjaan({required this.place});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailScreenWeb(
              place: place,
            );
          } else {
            return DetailScreenMobile(place: place);
          }
        });
  }
}

class DetailScreenMobile extends StatelessWidget {
  final Groceries place;

  DetailScreenMobile({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.network(place.productImageUrls[0]),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))),
                        FavoriteButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.store),
                      SizedBox(height: 8.0),
                      Text(
                        place.storeName,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on_rounded),
                      SizedBox(height: 8.0),
                      Text(
                        place.price,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      SizedBox(height: 8.0),
                      Text(
                        place.stock,
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.sell),
                      SizedBox(height: 8.0),
                      Text(
                        place.discount,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.star),
                      SizedBox(height: 8.0),
                      Text(
                        place.reviewAverage,
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.productImageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenWeb extends StatefulWidget {
  final Groceries place;

  DetailScreenWeb({required this.place});

  @override
  _DetailScreenWebState createState() => _DetailScreenWebState();
}

class _DetailScreenWebState extends State<DetailScreenWeb> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Groceries'),
          backgroundColor: Colors.lightGreen,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            child: Center(
              child: Container(
                width: 1200,
                child: Column(
                  children: [
                    Text("Groceries",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Staatliches',
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.network(widget.place.productImageUrls[0]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              SizedBox(height: 16),
                              Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Scrollbar(
                                  controller: _scrollController,
                                  isAlwaysShown: true,
                                  child: ListView(
                                    controller: _scrollController,
                                    padding: EdgeInsets.only(bottom: 16),
                                    scrollDirection: Axis.horizontal,
                                    children: widget.place.productImageUrls.map((url) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(url),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      widget.place.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Staatliches',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.monetization_on_rounded),
                                          SizedBox(width: 8.0),
                                          Text(
                                            widget.place.price,
                                            style: informationTextStyle,
                                          ),
                                        ],
                                      ),
                                      FavoriteButton(),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.store),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.place.storeName,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.shopping_cart),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.place.stock,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.sell),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.place.discount,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.star),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.place.reviewAverage,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      widget.place.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Oxygen',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
