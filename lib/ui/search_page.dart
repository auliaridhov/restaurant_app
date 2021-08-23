import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/result_search.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SearchPage extends StatelessWidget {

  Widget _buildList(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResult(query: value)),
              );
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search ',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Search'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
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



