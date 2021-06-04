import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gundam_info/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> filterOptions;

  const FilterScreen(
    this.saveFilters,
    this.filterOptions,
  );

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _massProduction = false;
  bool _worthyGunpla = false;

  @override
  void initState() {
    _massProduction = widget.filterOptions['mass'] as bool;
    _worthyGunpla = widget.filterOptions['worthy'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: _massProduction,
        onChanged: (newValue) {
          setState(() {
            _massProduction = newValue;
            print(_massProduction);
          });
        });
  }

  Widget _buildSwitchListTileWorthy(String title, String description) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: _worthyGunpla,
        onChanged: (newValue) {
          setState(() {
            _worthyGunpla = newValue;
            print(_worthyGunpla);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'mass': _massProduction,
                'worthy': _worthyGunpla,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save_rounded),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your MS Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Mass Production',
                  'Only Show Mass Produced MS',
                ),
                _buildSwitchListTileWorthy(
                  'Worthy To Buy',
                  'Only Show Worthy Gunpla',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
