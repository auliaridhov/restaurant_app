import 'package:flutter/material.dart';
import 'package:restaurant_app/common/image_url.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant data;

  DetailScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            //height: 300,
            height: MediaQuery.of(context).size.height * .65,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrlLarge + data.pictureId),
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
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Row(
                      children: [
                        Icon(Icons.location_pin),
                        Text(data.city),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Text(
                      data.name,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[700]),
                        Text(
                          data.rating.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                        top: 5, left: 20, right: 20, bottom: 10),
                    child: Text(
                      data.description,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Foods",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    height: 170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.menus.foods == null
                          ? 0
                          : data.menus.foods.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        margin: EdgeInsets.all(5),
                        child: Card(
                          elevation: 4.0,
                          child: Container(
                            width: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/foods.jpg"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Text(
                                    data.menus.foods[index].name,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 40, left: 20, right: 10),
                    child: Text(
                      "Drinks",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.menus.drinks == null
                          ? 0
                          : data.menus.drinks.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        margin: EdgeInsets.all(5),
                        child: Card(
                          elevation: 4.0,
                          child: Container(
                            width: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/drinks.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: Text(
                                    data.menus.drinks[index].name,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Reviews",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 20, bottom: 40, right: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.customerReviews == null
                          ? 0
                          : data.customerReviews.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage:
                                      AssetImage("assets/images/profile.png"),
                                ),
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.customerReviews[index].name,
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.customerReviews[index].review,
                                      textScaleFactor: 1.0,
                                    ),
                                    Text(
                                      data.customerReviews[index].date,
                                      textScaleFactor: 0.9,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
