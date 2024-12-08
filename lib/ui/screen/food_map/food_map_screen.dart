import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/repositories/models/post_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widget/button_map_floating_widget.dart';

class FoodMapScreen extends StatefulWidget {
  const FoodMapScreen({super.key, required this.postModel});
  final PostModel postModel;
  @override
  State<StatefulWidget> createState() {
    return FoodMapScreenState();
  }
}

class FoodMapScreenState extends State<FoodMapScreen> {
  late GoogleMapController _mapController;
  BitmapDescriptor currentLocationMarker = BitmapDescriptor.defaultMarker;

  Set<Marker> markerShowing = <Marker>{};

  // createCurrentLocationMarker() async {
  //   Position curentLocation = await Geolocator.getCurrentPosition();
  //   currentLocationA =
  //       LatLng(curentLocation.latitude, curentLocation.longitude);
  //   BitmapDescriptor.asset(const ImageConfiguration(size: Size(32, 32)),
  //           "assets/images/device.png")
  //       .then((value) {
  //     setState(() {
  //       currentLocationMarker = value;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // createCurrentLocationMarker();
  }

  Set<Marker> createMakers(List<LatLng> sharingLocation) {
    Set<Marker> makers = {};

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
            LatLng(widget.postModel.lat!, widget.postModel.lng!),
          ]),
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.postModel.lat!, widget.postModel.lng!),
            zoom: 14.0,
          ),
        ),
        const ButtonMapFloatingWidget(),
      ],
    ));
  }
}
