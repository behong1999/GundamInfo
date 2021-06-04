import 'package:flutter/material.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/screens/favorites_screen.dart';
import 'package:gundam_info/screens/universe_screen.dart';
import 'package:gundam_info/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<MobileSuit> favoriteMSs;

  const TabScreen(this.favoriteMSs);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  //*
  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      //* Instantiated Widgets
      {
        'page': UniverseScreen(),
        'title': 'Universes',
      },
      {
        //! Avoid the issue of widget of favortieMss property
        //! which is not avalable when initializing the class
        'page': FavoriteScreen(widget.favoriteMSs),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        // NOTE: When a tab is selected, Flutter will automatically give us the index of the selected tab
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.blur_circular_rounded),
            title: Text('Universes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
