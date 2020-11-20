import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';
import 'package:hello_world_colors/data/all_24bit_colors.dart';
import 'package:hello_world_colors/data/basic_color_terms.dart';
import 'package:hello_world_colors/data/material_colors.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/data/web_color_list.dart';
import 'package:hello_world_colors/widgets/app_drawer.dart';
import 'package:hello_world_colors/widgets/named_color_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NamedColorList namedColorList = BasicColorTermList();

  void _onMainDrawerItemSelected(MainDrawerItem item) {
    setState(() {
      switch (item) {
        case MainDrawerItem.basicColorTerms:
          namedColorList = BasicColorTermList();
          break;
        case MainDrawerItem.webColors:
          namedColorList = WebColorList();
          break;
        case MainDrawerItem.materialColors:
          namedColorList = MaterialColorList();
          break;
        case MainDrawerItem.all24bitColors:
          namedColorList = All24BitColorList();
          break;
      }
    });

    // Close the drawer
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // MaterialColorList materialColorList = MaterialColorList();
    // for (int i = 0; i < materialColorList.length; i++)
    //   print('name: ${materialColorList[i].name}, color: ${materialColorList[i].color}');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      drawer: AppDrawer(
        onMainItemSelected: _onMainDrawerItemSelected,
      ),
      body: NamedColorGridView(
        namedColorList: namedColorList,
      ),
    );
  }
}
