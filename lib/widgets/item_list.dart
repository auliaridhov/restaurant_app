import 'package:flutter/material.dart';
import 'package:restaurant_app/common/image_url.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/ui/detail_page.dart';

class ItemList extends StatelessWidget {
  List<Restaurant> list;

  ItemList({ this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(data: list[i])),
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
                      image: NetworkImage(imageUrlSmall + list[i].pictureId),
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
                        list[i].name,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text(list[i].city),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[700]),
                          Text(list[i].rating.toString()),
                        ],
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
  }
}
