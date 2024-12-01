import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodioo/ui/General/spacing_vertical_widget.dart';
import 'package:foodioo/ui/General/svg_gen_size_widget.dart';
import 'package:foodioo/ui/general/spacing_horizontal_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Core/Constants/constant_stataue.dart';
import '../../../../Core/Theme/app_colors.dart';
import '../../../../Core/Theme/assets.gen.dart';

class BottomSheetPickingMapWidget extends StatefulWidget {
  const BottomSheetPickingMapWidget({super.key, required this.currentLocation});

  final LatLng currentLocation;

  @override
  State<StatefulWidget> createState() {
    return BottomSheetPickingMapWidgetState();
  }
}

class BottomSheetPickingMapWidgetState
    extends State<BottomSheetPickingMapWidget> {
  late GoogleMapController _mapController;
  TextEditingController controller = TextEditingController();
  LatLng? _selectedLocation;
  Marker? _marker;
  BitmapDescriptor currentLocationMarker = BitmapDescriptor.defaultMarker;

  void _updateMarker(LatLng location) {
    setState(() {
      _marker = Marker(
        icon: currentLocationMarker,
        markerId: const MarkerId('Vị trí đang chọn'),
        position: location,
      );
      _selectedLocation = location;
    });
  }

  double sizeBitMap = 28;
  createCurrentLocationMarker() async {
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

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.currentLocation;
    createCurrentLocationMarker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstant.radiusExtra),
              topRight: Radius.circular(AppConstant.radiusExtra)),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: AppConstant.paddingComponent),
              height: 6,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstant.radiusSmall),
                  color: Theme.of(context).hintColor),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  bottom: AppConstant.paddingComponent),
              child: Text("Chọn vị trí bạn muốn chia sẻ",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Container(
                margin: const EdgeInsetsDirectional.only(
                    bottom: AppConstant.paddingComponent),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: TextField(),
                    // ),
                    Expanded(
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstant.paddingHorizontalApp),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              BorderRadius.circular(AppConstant.radiusMedium),
                        ),
                        child: TextField(
                          autofocus: true,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            // if (value.isNotEmpty) {
                            //   // context.read<ListCustomerBloc>().add(SearchCustomer(
                            //   //       key: value,
                            //   //       teamType: widget.teamType,
                            //   //     ));
                            //   setState(() {
                            //     isShowClear = true;
                            //   });
                            // }
                          },
                          controller: controller,
                          onSubmitted: (value) {
                            // print("Data akko: $value");
                            // if (value == "") {
                            //   MessageToast.showToast(
                            //       context, "Hãy nhập từ khóa trước khi nhập!!");
                            // } else {
                            //   context
                            //       .read<ListCustomerBloc>()
                            //       .add(SearchCustomer(
                            //         key: value,
                            //         teamType: widget.teamType,
                            //       ));
                            // }
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            hintText:
                                'Nhập mã khách hàng, mã dms, mã số thuế, số điện thoại để tìm kiếm',
                            hintStyle: Theme.of(context).textTheme.labelMedium,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            // icon: Image.asset(
                            //   'assets/icons/icon_search_2.png',
                            //   height: 24,
                            //   color: AppColors.textBlack,
                            // ),
                            icon: GestureDetector(
                              onTap: () {
                                // if (controller.value.text == "") {
                                //   MessageToast.showToast(context,
                                //       "Hãy nhập từ khóa trước khi nhập!!");
                                // } else {
                                //   context
                                //       .read<ListCustomerBloc>()
                                //       .add(SearchCustomer(
                                //         key: controller.value.text,
                                //         teamType: widget.teamType,
                                //       ));
                                // }
                                // removeFocus(context);
                              },
                              child: SvgGenSizeWidget(
                                  icon: Assets.icons.search
                                      .svg(color: AppColors.black)),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                                minWidth: AppConstant.paddingButton),
                            suffixIconConstraints: const BoxConstraints(
                                minWidth: AppConstant.paddingButton),
                            // suffixIcon: isShowClear
                            //     ? GestureDetector(
                            //         onTap: () {
                            //           setState(() {
                            //             controller.clear();
                            //             isShowClear = false;
                            //           });
                            //           removeFocus(context);
                            //           context
                            //               .read<ListCustomerBloc>()
                            //               .add(CleanDataSearch());
                            //         },
                            //         child: Icon(
                            //           Icons.close,
                            //           size: 20.h,
                            //           color: AppColors.textBlack,
                            //         ))
                            //     : null,
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     if (_selectedLocation != null) {
                    //       Navigator.of(context).pop(_selectedLocation!);
                    //     }
                    //   },
                    //   child: Container(
                    //       margin:
                    //           const EdgeInsets.all(AppConstant.paddingContent),
                    //       padding: const EdgeInsets.all(
                    //           AppConstant.paddingComponent - 5),
                    //       decoration: BoxDecoration(
                    //         color: Theme.of(context).primaryColor,
                    //         borderRadius:
                    //             BorderRadius.circular(AppConstant.radiusSmall),
                    //       ),
                    //       child: SvgGenSizeWidget(
                    //         icon: Assets.icons.search.svg(
                    //           color: Colors.white,
                    //         ),
                    //       )),
                    // ),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.paddingComponent,
                ),
                child: GoogleMap(
                  mapType: MapType.terrain,
                  myLocationButtonEnabled: false,
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer())
                  },
                  initialCameraPosition: CameraPosition(
                    target: _selectedLocation ?? const LatLng(0, 0),
                    zoom: 15.0,
                  ),
                  onMapCreated: (controller) => _mapController = controller,
                  markers: _marker != null ? {_marker!} : {},
                  onTap: (LatLng location) {
                    _updateMarker(location);
                  },
                ),
              ),
            ),
            const SpacingVerticalWidget(
                height: AppConstant.paddingHorizontalApp),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    if (_selectedLocation != null) {
                      Navigator.of(context).pop(_selectedLocation!);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstant.paddingHorizontalApp,
                        vertical: AppConstant.paddingComponent - 3),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.circular(AppConstant.radiusMedium),
                    ),
                    child: const Text(
                      'Lưu vị trí',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SpacingHorizontalWidget(
                    width: AppConstant.paddingVerticalApp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}