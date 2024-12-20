import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  static const String APP_NAME = "Foodioo";
  static const String APP_VERSION = "1.0.0";
  static String apiBaseURL = "${dotenv.env['API_BASE_URL']}/api";
  static String baseURL = "${dotenv.env['API_BASE_URL']}/";
  static String googleMapApiKey = "${dotenv.env['GOONG_API_KEY']}";
  static String keySoundOnClick = "sound_key_when_click";
  static String keyEnableVibration = "enable_vibration";
  static String messageGetSuccesData = "Lấy dữ liệu từ Foodioo thành công";
  static int pageSize = 20;

  static const double sizeIconLarge = 32.0;
  static const double sizeIconMedium = 24.0;

  static const double textSizeContent = 14.0;
  static const double textSizeHint = 12.0;
  static const double textSizeTitle = 18.0;
  static const double textSizeHeader = 28.0;
  static const double textSizeButton = 16.0;

  static const double radiusSmall = 9.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 18.0;
  static const double radiusExtra = 32.0;

  static const double paddingIcon = 3.0;
  static const double paddingIndicator = 4.0;
  static const double paddingButton = 18.0;
  static const double paddingContent = 3.0;
  static const double paddingComponent = 12.0;
  static const double paddingHorizontalApp = 18.0;
  static const double paddingVerticalApp = 22.0;

  static const int durationAnimationSystemGeneral = 300;
}
