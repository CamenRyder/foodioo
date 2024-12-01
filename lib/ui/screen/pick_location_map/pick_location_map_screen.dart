import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationMapScreen extends StatefulWidget {
  const PickLocationMapScreen({super.key});

  @override
  State<PickLocationMapScreen> createState() => _PickLocationMapScreenState();
}

class _PickLocationMapScreenState extends State<PickLocationMapScreen> {
  BitmapDescriptor currentLocationMarker = BitmapDescriptor.defaultMarker;
  Set<Marker> markerShowing = <Marker>{};
  late GoogleMapController _mapController;
  double sizeBitMap = 28;
  LatLng? _selectedLocation;
  Marker? _marker;

  createCurrentLocationMarker() async {
    Position curentLocation = await Geolocator.getCurrentPosition();
    _selectedLocation =
        LatLng(curentLocation.latitude, curentLocation.longitude);
    BitmapDescriptor.asset(
            ImageConfiguration(size: Size(sizeBitMap, sizeBitMap)),
            "assets/images/device.png")
        .then((value) {
      setState(() {
        currentLocationMarker = value;
      });
    });
    _marker = Marker(
        icon: currentLocationMarker,
        markerId: const MarkerId("currentLocation"),
        infoWindow: const InfoWindow(title: "Vị trí bạn đang cung cấp"),
        position: _selectedLocation!);
  }

  void _updateMarker(LatLng location) {
    setState(() {
      _marker = Marker(
          icon: currentLocationMarker,
          markerId: const MarkerId("currentLocation"),
          infoWindow: const InfoWindow(title: "Vị trí bạn đang cung caasp"),
          position: _selectedLocation!);
      _selectedLocation = location;
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
      appBar: AppBar(
        title: const Text('Chọn vị trí bạn muốn chia sẻ'),
      ),
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.terrain,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) => _mapController = controller,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())
          },
          markers: _marker != null ? {_marker!} : {},
          onTap: (LatLng location) {
            _updateMarker(location);
          },
          initialCameraPosition: CameraPosition(
            target: _selectedLocation ??
                const LatLng(10.869694877364696, 106.70485748904734),
            zoom: 15.0,
          ),
        ),
      ]),
    );
  }
}
