import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';

class NamedColorGridView extends StatelessWidget {
  final NamedColorList namedColorList;

  const NamedColorGridView({
    Key key,
    @required this.namedColorList,
  })  : assert(namedColorList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount: namedColorList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: screenSize.width / screenSize.height,
      ),
      itemBuilder: (BuildContext context, int index) =>
          NamedColorGridTile(namedColor: namedColorList[index]),
    );
  }
}

class NamedColorGridTile extends StatelessWidget {
  final NamedColor namedColor;

  const NamedColorGridTile({
    Key key,
    @required this.namedColor,
  })  : assert(namedColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        header: GridTileBar(
          title: Text(namedColor.name),
          subtitle: Text(namedColor.toHexTriplet()),
        ),
        footer: GridTileBar(
          leading: const Icon(Icons.brightness_3, size: 16.0),
          subtitle: Text(namedColor.color.computeLuminance().toStringAsFixed(4)),
        ),
        child: Material(
          child: InkWell(
            onTap: () {
              // AppSettings().color.value = blackAlt.color;
              // AppSettings().colorName.value = blackAlt.name;
              // Navigator.pop(context);
            },
          ),
          color: namedColor.color,
        ),
      ),
    );
  }
}
