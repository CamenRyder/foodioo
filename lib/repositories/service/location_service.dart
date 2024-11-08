import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() => _instance;

  LocationService._internal();

  Future<bool> checkPermission() async {
    // hàm ktra vị trí có được bật chưa. viết hơi stupid chút ;()
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    return true;
  }

  // lấy vị trí hiện tại của user.
  Future<Position?> getCurrentPosition() async {
    if (await checkPermission()) {
      final position = await Geolocator.getCurrentPosition();
      return position;
    }
    return null;
  }
}
