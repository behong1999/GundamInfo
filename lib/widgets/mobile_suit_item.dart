import 'package:flutter/material.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/screens/mobile_suit_detail_screen.dart';

class MobileSuitItem extends StatelessWidget {
  final String id;
  final String model;
  final String imageUrl;
  final String description;
  final Complexity complexity;
  // final Function removeItem;

  MobileSuitItem({
    required this.id,
    required this.model,
    required this.imageUrl,
    required this.description,
    required this.complexity,
    // required this.removeItem,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Easy';
        // ignore: dead_code
        break;
      case Complexity.Normal:
        return 'Normal';
        // ignore: dead_code
        break;
      case Complexity.Hard:
        return 'Hard';
        // ignore: dead_code
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMS(BuildContext context) {
    //NOTE: push() method works when there are only 2 or 3 routes
    //NOTE: pushNamed() should be used when having multiple routes
    Navigator.of(context)
        .pushNamed(
      MobileSuitDetailScreen.routeName,
      arguments: id,
    )
        //* When the PUSHED screen is popped THEN this functions is executed
        //! NOT WHEN THE PAGE IS PUSHED
        //REVIEW: CHANGE NEEDED
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //* A rectangular area of a Material that responds to touch.
    return InkWell(
      onTap: () => selectMS(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),

                //*Set Position for the Complexity
                Positioned(
                  bottom: 18,
                  right: 20,
                  child: Text(
                    complexityText,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          model,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
