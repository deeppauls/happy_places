import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:happy_places/providers/great_places.dart';
import 'package:happy_places/screens/add_place_screen.dart';
import 'package:happy_places/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Start Adding Your Happy Places!'),
                ),
                builder: (context, value, child) => value.items.length <= 0
                    ? child
                    : ListView.builder(
                        itemCount: value.items.length,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          margin: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: FileImage(
                                value.items[index].image,
                              ),
                            ),
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 7),
                              child: Text(
                                value.items[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Text(
                              value.items[index].location.address,
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                PlaceDetailScreen.routeName,
                                arguments: value.items[index].id,
                              );
                            },
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
