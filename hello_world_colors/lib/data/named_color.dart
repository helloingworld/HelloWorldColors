import 'package:flutter/material.dart';
import 'package:hello_world_colors/utils/utils.dart';

class NamedColor {
  final String name;
  final Color color;

  String toHexTriplet() => color.toHexTriplet();

  const NamedColor(this.name, this.color);
}

abstract class NamedColorList {
  /// The number of named colors in this list.
  int get length;

  /// Returns the object at the given [index] in the list
  /// or throws a [RangeError] if [index] is out of bounds.
  NamedColor operator [](int index);
}
