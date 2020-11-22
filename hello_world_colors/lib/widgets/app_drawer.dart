import 'package:flutter/material.dart';
import 'package:hello_world_colors/common/app_strings.dart';

enum MainDrawerItem { basicColorTerms, webColors, materialColors, all24bitColors }
enum ExtraDrawerItem { settings }

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key, this.onMainItemSelected, this.onExtraItemSelected}) : super(key: key);

  final void Function(MainDrawerItem value) onMainItemSelected;

  final void Function(ExtraDrawerItem value) onExtraItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          for (MainDrawerItem mainItem in MainDrawerItem.values)
            ListTile(
              title: Text(AppStrings.mainDrawerItems[mainItem]),
              onTap: () => onMainItemSelected?.call(mainItem),
            ),
          const Divider(),
          for (ExtraDrawerItem extraItem in ExtraDrawerItem.values)
            ListTile(
              title: Text(AppStrings.extraDrawerItems[extraItem]),
              onTap: () => onExtraItemSelected?.call(extraItem),
            ),
        ],
      ),
    );
  }
}
