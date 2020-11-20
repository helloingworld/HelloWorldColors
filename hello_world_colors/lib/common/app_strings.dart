import 'package:hello_world_colors/widgets/app_drawer.dart';

class AppStrings {
  static const String appName = 'Hello World Colors';

  static const Map<MainDrawerItem, String> mainDrawerItems = {
    MainDrawerItem.basicColorTerms: 'Basic Color Terms',
    MainDrawerItem.webColors: 'Web Colors',
    MainDrawerItem.materialColors: 'Material Colors',
    MainDrawerItem.all24bitColors: 'All 24-bit Colors',
  };

  static const Map<ExtraDrawerItem, String> extraDrawerItems = {
    ExtraDrawerItem.settings: 'Settings',
  };

  static const String basicColorTermsDrawerItem = 'Basic Color Terms';
  static const String basicWebColorsDrawerItem = 'Basic Web Colors';
  static const String webColorsDrawerItem = 'Web Colors';
  static const String materialColorsDrawerItem = 'Material Colors';
}
