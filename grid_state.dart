import 'dart:async';

import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:myapp/frequencies.dart';

class GridState extends ChangeNotifier{
  final int gridSize;

  MusicalKey musicalKey;
  String musicalKeyName;
  
  GridState({this.gridSize = 7}) {
    musicalKey = MusicalKey.getMajor("C4");
    musicalKeyName = "C4 Major";
    SystemChrome.setEnabledSystemUIOverlays([]);
    rootBundle.load("assets/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });

  }

}