import 'package:flutter/material.dart';
import 'package:hello_world_colors/utils/utils.dart';

class NamedColor {
  const NamedColor({this.name, this.color, this.isDark});

  final String name;
  final Color color;
  final bool isDark;

  String toHexTriplet() => color.toHexTriplet();
}
