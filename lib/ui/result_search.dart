import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/widgets/item_list.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class SearchResult extends StatelessWidget {
  final String query;

  const SearchResult({this.query, Key key}) : super(key: key);

  @override
  Widget _buildList(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (_) =>
          SearchRestaurantProvider(apiService: ApiService(), query: query),
      child: Consumer<SearchRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.searchResult.restaurants.length,
              itemBuilder: (context, index) {
                var article = state.searchResult.restaurants[index];
                return ItemList(list: state.searchResult.restaurants);
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
      ),
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
