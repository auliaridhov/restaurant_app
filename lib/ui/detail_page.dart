import 'package:flutter/material.dart';
import 'package:restaurant_app/common/image_url.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class DetailScreen extends StatefulWidget {
  Restaurant data;

  DetailScreen({this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              //height: 300,
              height: MediaQuery.of(context).size.height * .65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrlLarge + widget.data.pictureId),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .58),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Row(
                          children: [
                            Icon(Icons.location_pin),
                            Text(widget.data.city),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: Text(
                          widget.data.name,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber[700]),
                            Text(widget.data.rating.toString(), style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 40),
                        child: Text(
                          widget.data.description,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
