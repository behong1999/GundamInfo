import 'package:flutter/material.dart';
import 'package:gundam_info/models/mobile_suit.dart';
import 'package:gundam_info/models/universe.dart';

const DUMMY_UNIVERSE = [
  Universe(
    id: 'u1',
    name: 'Universal Century',
    color: Colors.pink,
  ),
  Universe(
    id: 'u2',
    name: 'Cosmic Era',
    color: Colors.blue,
  ),
  Universe(
    id: 'u3',
    name: 'Anno Domini',
    color: Colors.green,
  ),
  Universe(
    id: 'u4',
    name: 'After Colony',
    color: Colors.yellow,
  ),
  Universe(
    id: 'u5',
    name: 'Post Disaster',
    color: Colors.red,
  ),
  Universe(
    id: 'u6',
    name: 'Future Century',
    color: Colors.purple,
  ),
];

const DUMMY_MOBILE_SUITS = [
  MobileSuit(
    id: 'm1',
    universeId: 'u2',
    model: 'GAT-04+AQM/E-A4E1 Jet Windam',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/6/63/GAT-04%2BAQM_E-A4E1_Jet_Windam_Standart.png/revision/latest/scale-to-width-down/620?cb=20181203213143',
    armaments: [
      'M9409L Beam Rifle',
      'A52 Offensive Shield Type E (Mk438/B Dual Multipurpose Missile "Würger" SA10)',
      '2 × ES04B Beam Saber',
      'AQM/E-A4E1 Jet Striker'
    ],
    description:
        'A variant of the mass-production multi-mode mobile suit GAT-04 Windam featured in the anime series Mobile Suit Gundam SEED Destiny. Neo Roanoke piloted a custom colored unit.',
    complexity: Complexity.Easy,
    isMassProduction: true,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm2',
    universeId: 'u2',
    model: 'ZGMF-X56S/α Force Impulse Gundam',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/e/e8/ZGMF-X56S%CE%B1_Force_Impulse_Gundam_%28Front%29.png/revision/latest/scale-to-width-down/620?cb=20181214151719',
    armaments: [
      'MMI-RG59V Mobile Shield',
      'MA-BAR72 High-Energy Beam Rifle',
      'Silhouette Packs',
      '2 × M71-AAK "Folding Razor" Anti-armor Knife',
      '2 × MA-M941 "Vajra" Beam Saber'
    ],
    description:
        'A Mobile Suit featured in the Mobile Suit Gundam SEED Destiny television series. It is piloted by Shinn Asuka and later by Lunamaria Hawke.',
    complexity: Complexity.Normal,
    isMassProduction: false,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm3',
    universeId: 'u1',
    model: 'RX-78-2 Gundam',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/0/0f/RX-78-02_Gundam.png/revision/latest/scale-to-width-down/285?cb=20180129162142',
    armaments: ['Beam Rifle', 'Shield', 'Shoulder Cannon', '1-2 × Beam Saber'],
    description:
        'The titular mobile suit of the Mobile Suit Gundam: The Origin manga. It also appears briefly in the Mobile Suit Gundam: The Origin OVA and the Mobile Suit Gundam: The Origin Advent of the Red Comet television series. It was piloted by Amuro Ray during the One Year War.',
    complexity: Complexity.Hard,
    isMassProduction: false,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm4',
    universeId: 'u1',
    model: 'MS-06S Char\'s Zaku II',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/5/5d/Zaku_II_Origin.png/revision/latest/scale-to-width-down/604?cb=20170505154118',
    armaments: [
      'Shoulder Shield',
      'Machine Gun',
      'Heat Hawk',
      'ASR-78 MS Anti-Ship Rifle',
      'Type A2 MS Bazooka'
    ],
    description:
        "MS-06S Char's Zaku II is a Mobile Suit featured in the Mobile Suit Gundam:"
        " The Origin manga and its OVA adaptation. It was piloted by Char Aznable during the One Year War. Char's MS-06S Zaku II is a customized version of the standard MS-06S Zaku II Commander Type (an overall improved MS-06F Zaku II) painted in his personal red colors."
        " Being a commander's unit, a horn-like decoration was also attached to its head. Despite the high risks, Char personally ordered the removal of its limiters, allowing it to use its thrusters to the maximum limit."
        " The hit-and-run tactics enabled by the resulting high thrust, and the impression its distinctive colors made on the battlefield, led to Char's nick name, \"Red Comet\". "
        "After the Clash of Loum, Vice Admiral Dozle secretly ordered Char to command the Falmer, a custom Musai-class battleship, and unit emblems and victory markings were applied to his MS-06S. These included bright white lines indicting it as the commander's unit, the unit number \"A12\" and emblems of the Falmer",
    complexity: Complexity.Hard,
    isMassProduction: false,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm5',
    universeId: 'u2',
    model: 'ZGMF-X42S Destiny Gundam',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/c/cf/Zgmf-x42s.jpg/revision/latest?cb=20130330220747',
    armaments: [
      'M2000GX high-energy long-range beam cannon',
      'MMI-714 "Arondight" beam sword',
      '2 × MMI-X340 "Palma Fiocina" palm beam cannon',
      '2 × MX2351 "Solidus Fulgor" beam shield generator',
      '2 × RQM60F "Flash-Edge 2" beam boomerang',
      'MA-BAR73/S high-energy beam rifle',
      'Shield',
      'Voiture Lumiere propulsion system (Wings of Light)'
    ],
    description:
        'The ZGMF-X42S Destiny Gundam is the titular mobile suit of Mobile Suit Gundam SEED Destiny and was piloted by Shinn Asuka. A straight-built Gunpla version is piloted by Shimon Izuna in Gundam Build Fighters Try.',
    complexity: Complexity.Hard,
    isMassProduction: false,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm6',
    universeId: 'u2',
    model: 'ZGMF-X19A ∞ Justice Gundam',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/8/86/Zgmf-x19a.jpg/revision/latest?cb=20110308090513',
    armaments: [
      '2 × MMI-GAU26 17.5mm Twin CIWS',
      '2 × MMI-M19L 14mm Twin CIWS',
      '2 × MA-M02G "Super Lacerta" Beam Saber',
      '2 × MR-Q15A "Griffon" Beam Blade',
      'Fatum-01',
      'MA-M1911 High-energy Beam Rifle',
      'MX2002 Carrier Beam Shield'
    ],
    description:
        'The ZGMF-X19A ∞ Justice Gundam (aka Infinite Justice, Justice) is a mobile suit and the successor to the ZGMF-X09A Justice Gundam. It appears in Mobile Suit Gundam SEED Destiny and is piloted by Athrun Zala.',
    complexity: Complexity.Hard,
    isMassProduction: false,
    isWorthyGunpla: true,
  ),
  MobileSuit(
    id: 'm7',
    universeId: 'u5',
    model: 'ASW-G-08 Gundam Barbatos Lupus Rex',
    imageUrl:
        'https://static.wikia.nocookie.net/gundam/images/5/5a/ASW-G-08_Gundam_Barbatos_Lupus_Rex_%28Front%29.png/revision/latest/scale-to-width-down/620?cb=20181006220542',
    armaments: [
      '2 × Sub-Arm',
      'Tail Blade',
      'Ultra Large Mace (2 × Pile Bunker)',
      'Thrusters',
      '2 × 200mm Gun',
      '2 × Heel Bunker',
    ],
    description:
        'The ASW-G-08 Gundam Barbatos Lupus Rex (ガンダムバルバトスルプスレクス?) is the main mobile suit featured in the second half of Mobile Suit Gundam IRON-BLOODED ORPHANS second season. It is piloted by Mikazuki Augus.',
    complexity: Complexity.Hard,
    isMassProduction: false,
    isWorthyGunpla: false,
  ),
];
