import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';
import 'package:hello_world_colors/data/material_colors.dart';
import 'package:hello_world_colors/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  MainDrawerItem _mainDrawerItem;


  void _onMainDrawerItemSelected(MainDrawerItem item) {
    setState(() {
      _mainDrawerItem = item;
    });
    // switch (item) {
    //   case MainDrawerItem.basicColorTerms:
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    MaterialColorList materialColorList = MaterialColorList();
    for (int i = 0; i < materialColorList.length; i++)
      print('name: ${materialColorList[i].name}, color: ${materialColorList[i].color}');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      drawer: AppDrawer(
        onMainItemSelected: _onMainDrawerItemSelected,
      ),
    );
  }

}
