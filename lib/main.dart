import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widgets/home_page.dart';
import 'package:restaurant_app/widgets/item_list.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

import 'common/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key,  this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  List list = listRestaurant;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        physics: ScrollPhysics(),
//        child: Container(
//          margin:
//          EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0, bottom: 20.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Text(
//                "Restaurant",
//                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//              ),
//              Text(
//                "Recommendation restaurant for you!",
//                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//              ),
//              ItemList(list: list),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}


class MyHomePage extends StatelessWidget {
  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var article = state.result.restaurants[index];
              return ItemList(list: state.result.restaurants);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
