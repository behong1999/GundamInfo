import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gundam_info/dummy_data.dart';

class MobileSuitDetailScreen extends StatelessWidget {
  static const routeName = '/ms-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MobileSuitDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildTitleSection(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.title),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      height: 150,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(8),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //* This method returns the current route with the arguments
    final msId = ModalRoute.of(context)!.settings.arguments as String;

//* Return only the first item where the function returns true value required by firstWhere
    final selectedMS =
        DUMMY_MOBILE_SUITS.firstWhere((mobile_suit) => mobile_suit.id == msId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(selectedMS.model),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                toggleFavorite(msId);
              },
              child: Icon(isFavorite(msId)
                  ? Icons.star_outlined
                  : Icons.star_outline_sharp),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMS.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),

            buildTitleSection(context, 'Armaments'),
            //! ListView has an infinite height by default
            //! It's in a column which also get as much height as possible
            //! Which throws an error
            //* ListView should be inside Container with a fixed height
            buildContainer(
                context,
                //* List of Armaments
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 22,
                      ),
                      child: Text(
                        selectedMS.armaments[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  itemCount: selectedMS.armaments.length,
                )),

            Divider(
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),

            buildTitleSection(context, 'Description'),
            buildContainer(
              context,
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(
                  selectedMS.description,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(msId);
        },
      ),
    );
  }
}
