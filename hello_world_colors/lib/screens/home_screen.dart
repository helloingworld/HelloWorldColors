// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';
import 'package:hello_world_colors/data/basic_color_term_list.dart';
import 'package:hello_world_colors/data/color_list.dart';
import 'package:hello_world_colors/data/material_color_list.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/data/web_color_list.dart';
import 'package:hello_world_colors/data/wikipedia_list_of_colors_list.dart';
import 'package:hello_world_colors/screens/hello_color_screen.dart';
import 'package:hello_world_colors/utils/utils.dart';
import 'package:hello_world_colors/widgets/color_sliver_grid.dart';

/// Overflow menu items enumeration.
// enum OverflowMenuItem { settings, help, rate }
enum OverflowMenuItem { help, rate }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController _scrollController = ScrollController();
  Map<ColorList, GlobalKey> _keys;

  // List<GlobalKey> _keys;

  @override
  void initState() {
    super.initState();

    _keys = <ColorList, GlobalKey>{for (ColorList item in ColorList.values) item: GlobalKey()};

    // _keys = List<GlobalKey>.generate(5, (int i)i => GlobalKey());

    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   print(_scrollController.position.context.axisDirection);
    // });
  }

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

  void _onColorListPopupMenuItemSelected(ColorList list) {
    Scrollable.ensureVisible(
      _keys[list].currentContext,
      // curve: Curves.fastOutSlowIn,
      // curve: Curves.linear,
      curve: Curves.decelerate,
      duration: kThemeAnimationDuration,
      // duration: const Duration(milliseconds: 500),
    );
  }

  void _onOverflowMenuItemSelected(OverflowMenuItem item) {
    switch (item) {
      // case OverflowMenuItem.settings:
      //   break;
      case OverflowMenuItem.help:
        // Launch the app online help url
        launchUrl(_scaffoldKey.currentState, AppStrings.helpURL);
        break;
      case OverflowMenuItem.rate:
        // Launch the Google Play Store page to allow the user to rate the app
        launchUrl(_scaffoldKey.currentState, AppStrings.rateAppURL);
        break;
    }
  }

  /// Builds the popup menu items for the app bar.
  List<PopupMenuItem<OverflowMenuItem>> _buildOverflowItems(BuildContext context) {
    return OverflowMenuItem.values
        .map(
          (OverflowMenuItem item) => PopupMenuItem<OverflowMenuItem>(
            value: item,
            child: Text(AppStrings.overflowItems[item]),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: <Widget>[
          PopupMenuButton<ColorList>(
            icon: const Icon(Icons.arrow_circle_down),
            onSelected: _onColorListPopupMenuItemSelected,
            itemBuilder: (BuildContext context) => ColorList.values
                .map(
                  (ColorList item) => PopupMenuItem<ColorList>(
                    value: item,
                    child: Text(AppStrings.colorLists[item]),
                  ),
                )
                .toList(),
          ),
          PopupMenuButton<OverflowMenuItem>(
            onSelected: _onOverflowMenuItemSelected,
            itemBuilder: _buildOverflowItems,
          ),
        ],
      ),
      // drawer: AppDrawer(
      //   onMainItemSelected: _onMainDrawerItemSelected,
      // ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _buildListTitle(AppStrings.colorLists[ColorList.basicColorTerms]),
          NamedColorSliverGrid(
            key: _keys[ColorList.basicColorTerms],
            namedColorList: kBasicColorTermList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.webColors]),
          NamedColorSliverGrid(
            key: _keys[ColorList.webColors],
            namedColorList: kWebColorList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.materialColors]),
          NamedColorSliverGrid(
            key: _keys[ColorList.materialColors],
            namedColorList: kMaterialColorList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.wikipediaListOfColors]),
          NamedColorSliverGrid(
            key: _keys[ColorList.wikipediaListOfColors],
            namedColorList: kWikipediaListOfColorsList,
            onItemSelected: _onItemSelected,
          ),
          _buildListTitle(AppStrings.colorLists[ColorList.trueColor]),
          TrueColorSliverGrid(
            key: _keys[ColorList.trueColor],
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
