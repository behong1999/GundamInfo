import 'package:flutter/material.dart';
import 'package:gundam_info/dummy_data.dart';
import 'package:gundam_info/widgets/universe_item.dart';

class UniverseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_UNIVERSE
          .map(
            (verseData) => UniverseItem(
              verseData.id,
              verseData.name,
              verseData.color,
            ),
          )
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
