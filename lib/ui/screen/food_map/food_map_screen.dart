import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/Core/Constants/constant_stataue.dart';
import 'package:foodioo/Core/Theme/assets.gen.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
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
  late BitmapDescriptor myIcon;
  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            Assets.icons.deviceMobile.path)
        .then((onValue) {
      myIcon = onValue;
    });
  }

  Set<Marker> createMakers(
      List<LatLng> sharingLocation, LatLng currentLocation) {
    Set<Marker> makers = {};
    makers.add(
      Marker(
          icon:
             myIcon ,
          markerId: const MarkerId("currentLocation"),
          infoWindow: const InfoWindow(title: "Vị trí hiện tại"),
          position: currentLocation),
    );
    int index = 0;
    for (var element in sharingLocation) {
      final latlng = LatLng(element.latitude ?? 0, element.longitude ?? 0);
      makers.add(
          Marker(markerId: MarkerId("$index"), position: latlng, onTap: () {}));
      index++;
    }
    return makers;
  }

  final radiusButton = const Radius.circular(AppConstant.radiusLarge);

  @override
  Widget build(BuildContext context) {
    double paddingButton = 12.0;
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
          ], const LatLng(10.869694877364696, 106.70485748904734)),
          initialCameraPosition: const CameraPosition(
            target: LatLng(10.869694877364696, 106.70485748904734),
            zoom: 15.0,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppConstant.paddingVerticalApp),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: radiusButton, bottomLeft: radiusButton)),
                    padding: EdgeInsets.all(paddingButton),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgGenSizeWidget(
                            icon: Assets.icons.arrowLeft
                                .svg(color: Colors.black)),
                        Text(
                          "Quay lại",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.black,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: radiusButton, bottomRight: radiusButton)),
                    padding: EdgeInsets.all(paddingButton),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgGenSizeWidget(
                            icon: Assets.icons.deviceMobile
                                .svg(color: Colors.black)),
                        Text(
                          "Vị trí hiện tại",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
