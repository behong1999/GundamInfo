import 'package:flutter/material.dart';
import 'package:gundam_info/screens/universe_mobile_suits_screen.dart';

class UniverseItem extends StatelessWidget {
  final String id;
  final String name;
  final Color color;

  const UniverseItem(this.id, this.name, this.color);

  void selectUniverse(BuildContext context) {
    Navigator.of(context).pushNamed(UniverseMobileSuitsScreen.routeName,
        arguments: {'id': id, 'name': name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectUniverse(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
