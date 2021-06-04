import 'package:flutter/material.dart';
import 'package:gundam_info/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        //NOTE: There will be a stack of pages whose number is increasing
        //Navigator.of(context).pushNamed(route);
        //* SOLUTION
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.yellow,
          child: Text(
            'Gear Up!',
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile(context, 'Mobile Suits', Icons.accessibility, '/'),
        buildListTile(context, 'Filter', Icons.filter_alt_rounded,
            FilterScreen.routeName),
      ],
    ));
  }
}
