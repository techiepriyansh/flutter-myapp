import 'dart:async';

import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter.services.dart';

import 'package/frequencies.dart';

class GridState extends ChangeNotifier{
  final int gridSize;

  MusicalKey musicalKey;
  String musicalKeyName;
  
  GridState({this.gridSize = 6, this.musicalKey = MusicalKey.getMajor("C4"), this.musicalKeyName = "C4 Major"}) {
    rootBundle.load("assets/Perfect_Sine.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Perfect_Sine.sf2");
    });

  }

}