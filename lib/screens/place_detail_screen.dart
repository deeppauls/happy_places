import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:happy_places/providers/great_places.dart';
import 'package:happy_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlaces =
        Provider.of<GreatPlaces>(context, listen: false).findbyId(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlaces.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlaces.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              selectedPlaces.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => MapScreen(
                    initialLocation: selectedPlaces.location,
                    isSelecting: false,
                  ),
                ),
              );
            },
            child: Text(
              'View On Map',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.lightBlue,
            ),
          )
        ],
      ),
    );
  }
}
