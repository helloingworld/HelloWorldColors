import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';
import 'package:hello_world_colors/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  void _onDrawerItemSelected(AppDrawerItem item) {
    switch (item) {
      case AppDrawerItem.basicColorTerms:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      drawer: AppDrawer(
        onSelected: _onDrawerItemSelected,
      ),
    );
  }

}
