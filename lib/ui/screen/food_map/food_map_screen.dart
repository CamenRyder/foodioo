import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widget/button_map_floating_widget.dart';

class FoodMapScreen extends StatefulWidget {
  const FoodMapScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FoodMapScreenState();
  }
}

class FoodMapScreenState extends State<FoodMapScreen> {
  late GoogleMapController _mapController;
  BitmapDescriptor currentLocationMarker = BitmapDescriptor.defaultMarker;
  late LatLng currentLocationA;
  Set<Marker> markerShowing = <Marker>{};

  createCurrentLocationMarker() async {
    Position curentLocation = await Geolocator.getCurrentPosition();
    currentLocationA =
        LatLng(curentLocation.latitude, curentLocation.longitude);
    BitmapDescriptor.asset(const ImageConfiguration(size: Size(32, 32)),
            "assets/images/device.png")
        .then((value) {
      setState(() {
        currentLocationMarker = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    createCurrentLocationMarker();
  }

  Set<Marker> createMakers(
      List<LatLng> sharingLocation, LatLng currentLocation) {
    Set<Marker> makers = {};
    makers.add(
      Marker(
          icon: currentLocationMarker,
          markerId: const MarkerId("currentLocation"),
          infoWindow: const InfoWindow(title: "Vị trí của bạn"),
          position: currentLocation),
    );
    int index = 0;
    for (var element in sharingLocation) {
      final latlng = LatLng(element.latitude, element.longitude);
      makers.add(
          Marker(markerId: MarkerId("$index"), position: latlng, onTap: () {}));
      index++;
    }
    return makers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.terrain,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) => _mapController = controller,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())
          },
          markers: createMakers([
            const LatLng(10.86471114436039, 106.7008556333543),
            const LatLng(10.869389323190637, 106.70797958010037),
            const LatLng(10.862224514959449, 106.71089782334573),
            const LatLng(10.873962066748906, 106.70057668363232),
          ], currentLocationA),
          initialCameraPosition: const CameraPosition(
            target: LatLng(10.869694877364696, 106.70485748904734),
            zoom: 15.0,
          ),
        ),
        const ButtonMapFloatingWidget(),
      ],
    ));
  }
}
