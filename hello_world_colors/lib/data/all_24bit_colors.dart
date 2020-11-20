import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';

class All24BitColorList implements NamedColorList {
  @override
  NamedColor operator [](int index) {
    final Color color = Color(0xFF000000 + index);
    return NamedColor(color.toHexTriplet(), color);
  }

  @override
  int get length => 0xFFFFFF;
}
