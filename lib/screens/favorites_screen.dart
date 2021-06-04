import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/widgets/mobile_suit_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<MobileSuit> favoriteMSs;

  const FavoriteScreen(this.favoriteMSs);

  @override
  Widget build(BuildContext context) {
    if (favoriteMSs.isEmpty) {
      return Center(child: Text('No Favorites Yet!'));
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MobileSuitItem(
            id: favoriteMSs[index].id,
            model: favoriteMSs[index].model,
            imageUrl: favoriteMSs[index].imageUrl,
            description: favoriteMSs[index].description,
            complexity: favoriteMSs[index].complexity,
          );
        },
        itemCount: favoriteMSs.length,
      );
    }
  }
}
