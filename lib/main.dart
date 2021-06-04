import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gundam_info/dummy_data.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/screens/filter_screen.dart';
import 'package:gundam_info/screens/mobile_suit_detail_screen.dart';
import 'package:gundam_info/screens/tabs_screen.dart';
import 'package:gundam_info/screens/universe_mobile_suits_screen.dart';
import 'package:gundam_info/screens/universe_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'mass': false,
    'worthy': false,
  };

  List<MobileSuit> _availableMS = DUMMY_MOBILE_SUITS;
  List<MobileSuit> _favoriteMSs = [];

  //! FILTER
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      // TODO: implement setState
      //* _filters's values will be changed as that of filterData
      _filters = filterData;
      _availableMS = DUMMY_MOBILE_SUITS.where((mobileSuit) {
        if (_filters['mass'] == true && !mobileSuit.isMassProduction) {
          return false;
        }
        if (_filters['worthy'] == true && !mobileSuit.isWorthyGunpla) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  //! FAVORITE
  void _toggleFavorite(String msId) {
    final favoriteIndex = _favoriteMSs.indexWhere((ms) => ms.id == msId);
    if (favoriteIndex >= 0) {
      setState(() {
        _favoriteMSs.removeAt(favoriteIndex);
      });
    } else {
      setState(() {
        _favoriteMSs.add(DUMMY_MOBILE_SUITS.firstWhere((ms) => ms.id == msId));
      });
    }
  }

  //* This function runs for every mobile suit has the id we are checking
  bool _isFavoriteMS(String id) {
    return _favoriteMSs.any((ms) => ms.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gundam Database',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      title: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ))),
          primarySwatch: Colors.pink,
          accentColor: Colors.purple,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: const TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed-Bold',
              ))),

      //! If the home property is specified, the routes table cannot include an entry for "/",
      //! since it would be redundant
      //* You need to comment either of those lines
      //home: UniverseScreen(),

      //NOTE: default
      initialRoute: '/',

      //*Register every route for each page
      routes: {
        '/': (context) => TabScreen(_favoriteMSs),
        UniverseMobileSuitsScreen.routeName: (context) =>

            //* _availableMS <--> availableMobileSuits of UniverseMobileSuitsScreen
            UniverseMobileSuitsScreen(_availableMS),
        MobileSuitDetailScreen.routeName: (context) =>
            MobileSuitDetailScreen(_toggleFavorite, _isFavoriteMS),

        //* Pass a pointer into the FilterScreen and a list of MS meeting the filter
        FilterScreen.routeName: (context) =>

            //* _setFilters <--> saveFilters of FilterScreen
            //* _filters <--> filterOptions of FilterScreen
            FilterScreen(_setFilters, _filters),
      },

      //* Load initalRoute
      //* or '/' route when the requested route has not been registered yet
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (context) => UniverseScreen());
      },

      //NOTE: onUnknownRoute is reached when Flutter failed to build a screen
      // Root route is not defined or no route is defined in the routes table
      //! This one is used to avoid error or crashes, and show something on the screen instead
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => UniverseScreen());
      },
    );
  }
}
