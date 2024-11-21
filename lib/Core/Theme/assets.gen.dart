/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAvatarGen {
  const $AssetsAvatarGen();

  /// File path: assets/avatar/app_avatar.png
  AssetGenImage get appAvatar =>
      const AssetGenImage('assets/avatar/app_avatar.png');

  /// List of all assets
  List<AssetGenImage> get values => [appAvatar];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Add User.svg
  SvgGenImage get addUser => const SvgGenImage('assets/icons/Add User.svg');

  /// File path: assets/icons/Chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/icons/Chat.svg');

  /// File path: assets/icons/Edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/Edit.svg');

  /// File path: assets/icons/Heart.svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/Heart.svg');

  /// File path: assets/icons/Volume Off.svg
  SvgGenImage get volumeOff => const SvgGenImage('assets/icons/Volume Off.svg');

  /// File path: assets/icons/Volume Up.svg
  SvgGenImage get volumeUp => const SvgGenImage('assets/icons/Volume Up.svg');

  /// File path: assets/icons/account.svg
  SvgGenImage get account => const SvgGenImage('assets/icons/account.svg');

  /// File path: assets/icons/arrow-left.svg
  SvgGenImage get arrowLeft => const SvgGenImage('assets/icons/arrow-left.svg');

  /// File path: assets/icons/bag.svg
  SvgGenImage get bag => const SvgGenImage('assets/icons/bag.svg');

  /// File path: assets/icons/ban.svg
  SvgGenImage get ban => const SvgGenImage('assets/icons/ban.svg');

  /// File path: assets/icons/credit-card.svg
  SvgGenImage get creditCard =>
      const SvgGenImage('assets/icons/credit-card.svg');

  /// File path: assets/icons/device-mobile.svg
  SvgGenImage get deviceMobile =>
      const SvgGenImage('assets/icons/device-mobile.svg');

  /// File path: assets/icons/empty_box.json
  LottieGenImage get emptyBox =>
      const LottieGenImage('assets/icons/empty_box.json');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/image_picker.svg
  SvgGenImage get imagePicker =>
      const SvgGenImage('assets/icons/image_picker.svg');

  /// File path: assets/icons/key.svg
  SvgGenImage get key => const SvgGenImage('assets/icons/key.svg');

  /// File path: assets/icons/location-marker.svg
  SvgGenImage get locationMarker =>
      const SvgGenImage('assets/icons/location-marker.svg');

  /// File path: assets/icons/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/icons/mail.svg');

  /// File path: assets/icons/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/moon.svg');

  /// File path: assets/icons/music-note.svg
  SvgGenImage get musicNote => const SvgGenImage('assets/icons/music-note.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/setting.svg
  SvgGenImage get setting => const SvgGenImage('assets/icons/setting.svg');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/template.svg
  SvgGenImage get template => const SvgGenImage('assets/icons/template.svg');

  /// List of all assets
  List<dynamic> get values => [
        addUser,
        chat,
        edit,
        heart,
        volumeOff,
        volumeUp,
        account,
        arrowLeft,
        bag,
        ban,
        creditCard,
        deviceMobile,
        emptyBox,
        home,
        imagePicker,
        key,
        locationMarker,
        mail,
        moon,
        musicNote,
        notification,
        profile,
        search,
        setting,
        sun,
        template
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/device.png
  AssetGenImage get device => const AssetGenImage('assets/images/device.png');

  /// File path: assets/images/intro_01.png
  AssetGenImage get intro01 =>
      const AssetGenImage('assets/images/intro_01.png');

  /// File path: assets/images/intro_02.png
  AssetGenImage get intro02 =>
      const AssetGenImage('assets/images/intro_02.png');

  /// File path: assets/images/intro_03.png
  AssetGenImage get intro03 =>
      const AssetGenImage('assets/images/intro_03.png');

  /// List of all assets
  List<AssetGenImage> get values => [device, intro01, intro02, intro03];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsAvatarGen avatar = $AssetsAvatarGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
