import 'package:flutter/material.dart';
import 'package:hello_world_colors/utils/utils.dart';

class NamedColor {
  const NamedColor({this.name, this.color, this.isDark});

  final String name;
  final Color color;
  final bool isDark;

  String toHexTriplet() => color.toHexTriplet();
}

abstract class NamedColorList {
  /// The number of named colors in this list.
  int get length;

  /// Returns the object at the given [index] in the list
  /// or throws a [RangeError] if [index] is out of bounds.
  NamedColor operator [](int index);
}
