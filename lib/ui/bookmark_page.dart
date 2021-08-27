import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/item_list.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class BookmarkPage extends StatelessWidget {

  Widget _buildList(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.HasData) {
          return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return ItemList(list: provider.bookmarks[index]);
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Restaurant App'),
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
