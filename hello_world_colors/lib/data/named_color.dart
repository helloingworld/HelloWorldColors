import 'package:flutter/material.dart';
import 'package:hello_world_colors/utils/utils.dart';

class NamedColor {
  const NamedColor({this.name, this.color, this.isDark});

  final String name;
  final Color color;
  final bool isDark;

  String toHexTriplet() => color.toHexTriplet();

  String _toPercent(double value) => '${(value * 100).toStringAsFixed(0)}%';

  String toRGBString() => 'rgb(${color.red}, ${color.green}, ${color.blue})';

  String toHSLString() {
    final HSLColor hslColor = HSLColor.fromColor(color);
    return 'hsl(${hslColor.hue.toStringAsFixed(0)}, ${_toPercent(hslColor.saturation)}, ${_toPercent(hslColor.lightness)})';
  }

  String toHSVString() {
    final HSVColor hsvColor = HSVColor.fromColor(color);
    return 'hsv(${hsvColor.hue.toStringAsFixed(0)}, ${_toPercent(hsvColor.saturation)}, ${_toPercent(hsvColor.value)})';
  }
}
