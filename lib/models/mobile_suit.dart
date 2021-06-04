import 'package:flutter/material.dart';

enum Complexity { Easy, Normal, Hard }

class MobileSuit {
  final String id;
  final String universeId;
  final String model;
  final String imageUrl;
  final List<String> armaments;
  final String description;
  final Complexity complexity;
  final bool isMassProduction;
  final bool isWorthyGunpla;

  const MobileSuit({
    required this.id,
    required this.universeId,
    required this.model,
    required this.imageUrl,
    required this.armaments,
    required this.description,
    required this.complexity,
    required this.isMassProduction,
    required this.isWorthyGunpla,
  });
}
