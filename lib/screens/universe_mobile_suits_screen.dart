import 'package:flutter/material.dart';
import 'package:gundam_info/dummy_data.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/widgets/mobile_suit_item.dart';

class UniverseMobileSuitsScreen extends StatefulWidget {
  //*Can be accessed without instantiating the class
  static const routeName = '/universe-msuits';
  final List<MobileSuit> availableMobileSuits;

  UniverseMobileSuitsScreen(this.availableMobileSuits);

  @override
  _UniverseMobileSuitsScreenState createState() =>
      _UniverseMobileSuitsScreenState();
}

class _UniverseMobileSuitsScreenState extends State<UniverseMobileSuitsScreen> {
  late String universeName;
  late List<MobileSuit> displayedMobileSuits;
  var _loadedInitData = false;

  //* When the page gets loaded and the state gets created,
  //* all mobile suits based on the ID of the universe will be loaded
  @override
  void initState() {
    //! Don't need to call setState
    //! because this will automatically run before build runs the first time
    //! initState runs too early
    //! before we have the CONTEXT for the widgets or the widgets are not fully created
    //NOTE: As a result, routeData cannot be retrieved
    // TODO: implement initState
    // ...
    super.initState();
  }

  @override
  //*Runs a couple of times after the initialization of the state.
  //* It runs whenever the dependenices of the current state change
  //* when the attached widget
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //   //* Load Initial Data for the first time
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final universeId = routeArgs['id'];
      universeName = routeArgs['name'] as String;
      displayedMobileSuits = widget.availableMobileSuits.where((ms) {
        return ms.universeId.contains(universeId!);
      }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  //* The setState is overwritten when removing the MS which makes didChangeDependencies run
  // void _removeMS(String msId) {
  //   setState(() {
  //     displayedMobileSuits.removeWhere((ms) => ms.id == msId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(universeName),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MobileSuitItem(
            id: displayedMobileSuits[index].id,
            model: displayedMobileSuits[index].model,
            imageUrl: displayedMobileSuits[index].imageUrl,
            description: displayedMobileSuits[index].description,
            complexity: displayedMobileSuits[index].complexity,
            //*Simply forward a reference of removedMS function
            // removeItem: _removeMS,
          );
        },
        itemCount: displayedMobileSuits.length,
      ),
    );
  }
}
