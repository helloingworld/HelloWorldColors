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
  BasicColorTermList _basicColorTermList = BasicColorTermList();
  WebColorList _webColorList = WebColorList();
  MaterialColorList _materialColorList = MaterialColorList();
  All24BitColorList _all24bitColorList = All24BitColorList();

//  NamedColorList namedColorList = BasicColorTermList();

  void _onMainDrawerItemSelected(MainDrawerItem item) {
    setState(() {
      switch (item) {
        case MainDrawerItem.basicColorTerms:
          // namedColorList = BasicColorTermList();
          break;
        case MainDrawerItem.webColors:
          // namedColorList = WebColorList();
          break;
        case MainDrawerItem.materialColors:
          // namedColorList = MaterialColorList();
          break;
        case MainDrawerItem.all24bitColors:
          // namedColorList = All24BitColorList();
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

    // final SliverGridDelegateWithMaxCrossAxisExtent gridDelegate =
    //     SliverGridDelegateWithMaxCrossAxisExtent(
    //   maxCrossAxisExtent: 200.0,
    // );

    // namedColorList = MaterialColorList();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      // drawer: AppDrawer(
      //   onMainItemSelected: _onMainDrawerItemSelected,
      // ),
      // body: NamedColorGridView(
      //   namedColorList: namedColorList,
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverGrid(
          //   gridDelegate: gridDelegate,
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) =>
          //         NamedColorGridTile(namedColor: _basicColorTermList[index]),
          //     childCount: _basicColorTermList.length,
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   child: Text(AppStrings.mainDrawerItems[MainDrawerItem.basicColorTerms]),
          // ),
          _buildListTitle(AppStrings.mainDrawerItems[MainDrawerItem.basicColorTerms]),
          ColorsSliverGrid(namedColorList: _basicColorTermList),
          _buildListTitle(AppStrings.mainDrawerItems[MainDrawerItem.webColors]),
          ColorsSliverGrid(namedColorList: _webColorList),
          _buildListTitle(AppStrings.mainDrawerItems[MainDrawerItem.materialColors]),
          ColorsSliverGrid(namedColorList: _materialColorList),
          _buildListTitle(AppStrings.mainDrawerItems[MainDrawerItem.all24bitColors]),
          ColorsSliverGrid(namedColorList: _all24bitColorList),
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

class ColorsSliverGrid extends StatelessWidget {
  final NamedColorList namedColorList;

  const ColorsSliverGrid({
    Key key,
    @required this.namedColorList,
  })  : assert(namedColorList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // maxCrossAxisExtent: 200.0,
        maxCrossAxisExtent: 180.0,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: screenSize.width / screenSize.height,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => NamedColorGridTile(namedColor: namedColorList[index]),
        childCount: namedColorList.length,
      ),
    );
  }
}
