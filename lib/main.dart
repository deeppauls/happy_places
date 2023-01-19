import 'package:flutter/material.dart';
import 'package:happy_places/providers/great_places.dart';
import 'package:happy_places/screens/add_place_screen.dart';
import 'package:happy_places/screens/place_detail_screen.dart';
import 'package:happy_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Happy Places',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => AddPlaceScreen(),
          PlaceDetailScreen.routeName:(context) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
