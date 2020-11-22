import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';
import 'package:hello_world_colors/data/basic_color_term_list.dart';
import 'package:hello_world_colors/data/color_list.dart';
import 'package:hello_world_colors/data/material_color_list.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/data/web_color_list.dart';
import 'package:hello_world_colors/data/wikipedia_list_of_colors_list.dart';
import 'package:hello_world_colors/screens/hello_color_screen.dart';
import 'package:hello_world_colors/widgets/color_sliver_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void _onMainDrawerItemSelected(MainDrawerItem item) {
  //   setState(() {
  //     switch (item) {
  //       case MainDrawerItem.basicColorTerms:
  //         // namedColorList = BasicColorTermList();
  //         break;
  //       case MainDrawerItem.webColors:
  //         // namedColorList = WebColorList();
  //         break;
  //       case MainDrawerItem.materialColors:
  //         // namedColorList = MaterialColorList();
  //         break;
  //       case MainDrawerItem.all24bitColors:
  //         // namedColorList = All24BitColorList();
  //         break;
  //     }
  //   });
  //
  //   // Close the drawer
  //   Navigator.pop(context);
  // }

  void _onItemSelected(NamedColor value) {
    // print(value.name);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => HelloColorScreen(namedColor: value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      // drawer: AppDrawer(
      //   onMainItemSelected: _onMainDrawerItemSelected,
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildListTitle(AppStrings.colorLists[ColorList.basicColorTerms]),
          NamedColorSliverGrid(
            namedColorList: kBasicColorTermList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.webColors]),
          NamedColorSliverGrid(
            namedColorList: kWebColorList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.materialColors]),
          NamedColorSliverGrid(
            namedColorList: kMaterialColorList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.wikipediaListOfColors]),
          NamedColorSliverGrid(
            namedColorList: kWikipediaListOfColorsList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.trueColor]),
          TrueColorSliverGrid(
            onItemSelected: _onItemSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildListTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0, bottom: 32.0),
        // child: Text(title, style: Theme.of(context).textTheme.headline5),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 45.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
