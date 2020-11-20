import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';

class MaterialColorList implements NamedColorList {
  static final Map<MaterialColor, String> primariesNames = {
    Colors.red: 'Red',
    Colors.pink: 'Pink',
    Colors.purple: 'Purple',
    Colors.deepPurple: 'Deep Purple',
    Colors.indigo: 'Indigo',
    Colors.blue: 'Blue',
    Colors.lightBlue: 'Light Blue',
    Colors.cyan: 'Cyan',
    Colors.teal: 'Teal',
    Colors.green: 'Green',
    Colors.lightGreen: 'Light Green',
    Colors.lime: 'Lime',
    Colors.yellow: 'Yellow',
    Colors.amber: 'Amber',
    Colors.orange: 'Orange',
    Colors.deepOrange: 'Deep Orange',
    Colors.brown: 'Brown',
    Colors.blueGrey: 'Blue Grey',
  };

  @override
  NamedColor operator [](int index) {
    MaterialColor primary = Colors.primaries[index ~/ 10];
    int shade = index % 10;
    shade = shade == 0 ? 50 : shade * 100;

    return NamedColor('${primariesNames[primary]}[$shade]', primary[shade]);
  }

  @override
  int get length => Colors.primaries.length * 10;
}
