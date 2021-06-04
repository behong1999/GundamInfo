import 'package:flutter/material.dart';

class Universe {
  final String id;
  final String name;
  final Color color;

  const Universe(
      {required this.id, required this.name, this.color = Colors.white});
}
