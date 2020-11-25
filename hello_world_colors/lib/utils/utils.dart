import 'package:flutter/material.dart';

extension ColorX on Color {
  String toHexTriplet() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  // String toRGBString() => 'rgb($red, $green, $blue)';
  String toRGBString() => '$red, $green, $blue';

  String _toPercent(double value) => '${(value * 100).toStringAsFixed(0)}%';

  String toHSLString() {
    final HSLColor hslColor = HSLColor.fromColor(this);
    // return 'hsl(${hslColor.hue.toStringAsFixed(0)}°, ${_toPercent(hslColor.saturation)}, ${_toPercent(hslColor.lightness)})';
    return '${hslColor.hue.toStringAsFixed(0)}°, ${_toPercent(hslColor.saturation)}, ${_toPercent(hslColor.lightness)}';
  }

  String toHSVString() {
    final HSVColor hsvColor = HSVColor.fromColor(this);
    // return 'hsv(${hsvColor.hue.toStringAsFixed(0)}°, ${_toPercent(hsvColor.saturation)}, ${_toPercent(hsvColor.value)})';
    return '${hsvColor.hue.toStringAsFixed(0)}°, ${_toPercent(hsvColor.saturation)}, ${_toPercent(hsvColor.value)}';
  }

  String toLuminanceString() => computeLuminance().toStringAsFixed(5);

  String toBrightnessString() => ThemeData.estimateBrightnessForColor(this).toString();
}
