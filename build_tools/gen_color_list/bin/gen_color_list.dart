import 'dart:io';

import 'package:gen_color_list/bald_color.dart';
import 'package:yaml/yaml.dart';

void convertDataFile(String fileName) {
  // var dataFile = File(dataFilePath);
  // var yamlString = dataFile.readAsStringSync();
  // var yaml = loadYaml(yamlString);

  // for (var colorFields in yaml) {
  //   print(colorFields[0]);
  // }
  // print(yaml);

  final String data = File('./data/$fileName.yaml').readAsStringSync();
  final YamlList yamlList = loadYaml(data);
  final List<String> dartList = yamlList
      .map((color) =>
          'NamedColor(name: \'${color[0]}\', color: Color(${toHexColorString(color[1] as int)}), isDark: ${isDarkColor(BaldColor(color[1]))})')
      .toList();
  File('output\\$fileName.dart.temp').writeAsStringSync(dartList.join(',\n'));
}

void main(List<String> arguments) {
  convertDataFile('basic_color_term_list');
  convertDataFile('web_color_list');
  convertDataFile('material_color_list');
}
