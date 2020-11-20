

import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';

class MaterialColorList implements NamedColorList {
  @override
  NamedColor operator [](int index) {
    MaterialColor primary = Colors.primaries[index ~/ 10];
    int shade = index % 10;
    shade = shade == 0 ? 50 : shade * 100;



    return NamedColor('${primary.toString()}[$shade]', primary[shade]);
  }

  @override
  int get length => Colors.primaries.length * 10;
}