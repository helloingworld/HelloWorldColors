import 'package:hello_world_colors/data/color_list.dart';
import 'package:hello_world_colors/screens/home_screen.dart';
import 'package:hello_world_colors/widgets/app_drawer.dart';

class AppStrings {
  static const String appName = 'Hello World Colors';

  static const Map<ColorList, String> colorLists = <ColorList, String>{
    ColorList.basicColorTerms: 'Basic Color Terms',
    ColorList.webColors: 'Web Colors',
    ColorList.materialColors: 'Material Colors',
    ColorList.wikipediaListOfColors: 'Wikipedia\'s List Of Colors',
    // ColorList.trueColor: 'All True Colors',
    ColorList.trueColor: 'Random True Colors',
  };

  static const Map<OverflowMenuItem, String> overflowItems = <OverflowMenuItem, String>{
    // OverflowMenuItem.settings: 'Settings',
    OverflowMenuItem.rate: 'Rate app',
    OverflowMenuItem.help: 'Help',
  };

  static const Map<ExtraDrawerItem, String> extraDrawerItems = <ExtraDrawerItem, String>{
    ExtraDrawerItem.settings: 'Settings',
  };

  static const String basicColorTermsDrawerItem = 'Basic Color Terms';
  static const String basicWebColorsDrawerItem = 'Basic Web Colors';
  static const String webColorsDrawerItem = 'Web Colors';
  static const String materialColorsDrawerItem = 'Material Colors';

  static const String rateAppURL =
      'https://play.google.com/store/apps/details?id=com.thehellomaker.heyworldcolors';

  static const String helpURL = 'https://helloing.world/helloworldcolors/';
}
