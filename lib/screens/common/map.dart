import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../utils/print_log.dart';

class MapForGoogle extends StatefulWidget {
  const MapForGoogle({Key? key}) : super(key: key);

  @override
  State<MapForGoogle> createState() => _MapForGoogleState();
}

class _MapForGoogleState extends State<MapForGoogle> {
  final Completer<GoogleMapController> _mapController = Completer();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 12,
  );
  final TextEditingController _mapSearchController = TextEditingController();

  var googlePlace = GooglePlace("AIzaSyDlOrEAcZ5BkQZLpC0XcMZByNuvZ3Md-JY");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      color: Colors.red,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: TextField(
                controller: _mapSearchController,
                onChanged: (text) async {
                  var result = await googlePlace.autocomplete.get(text);
                  Log.i(result.toString());
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
