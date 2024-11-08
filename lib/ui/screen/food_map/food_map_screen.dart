import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMapScreen extends StatefulWidget {
  const FoodMapScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FoodMapScreenState();
  }
}

class FoodMapScreenState extends State<FoodMapScreen> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: 300,
          height: 700,
          child: GoogleMap(
            mapType: MapType.terrain,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) => _mapController = controller,
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer())
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(10.869694877364696, 106.70485748904734),
              zoom: 15.0,
            ),
          ),
        ));
  }
}
