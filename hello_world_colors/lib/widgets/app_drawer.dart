import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';

enum AppDrawerItem { basicColorTerms, webColors, materialColors, all24bitColors }

class AppDrawer extends StatelessWidget {

  final void Function(AppDrawerItem value) onSelected;

  const AppDrawer({Key key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          for (AppDrawerItem item in AppDrawerItem.values)
            ListTile(
              title: Text(AppStrings.drawerItems[item]),
              // onTap: () => onSelected(item),
              onTap: () => onSelected?.call(item),
            ),
        ],
      ),
    );
  }
}
