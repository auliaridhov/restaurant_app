import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/image_url.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';

import 'package:restaurant_app/ui/detail_page.dart';

class ItemList extends StatelessWidget {
  Restaurant list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(list.id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(id: list.id)),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageUrlSmall + list.pictureId),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            list.name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              Text(list.city),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber[700]),
                              Text(list.rating.toString()),
                            ],
                          ),
                          isBookmarked
                              ? IconButton(
                                  icon: Icon(Icons.bookmark),
                                  color: Theme.of(context).accentColor,
                                  onPressed: () =>
                                      provider.removeBookmark(list.id),
                                )
                              : IconButton(
                                  icon: Icon(Icons.bookmark_border),
                                  color: Theme.of(context).accentColor,
                                  onPressed: () => provider.addBookmark(list),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
