import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/my_colors.dart';
import 'package:myapp/grid_state.dart';


import 'package:flutter_midi/flutter_midi.dart';

class GridButton extends StatefulWidget {
  final int columnIndex;
  final int rowIndex;
  final int note; 

  GridButton(this.columnIndex, this.rowIndex, this.note, {Key key}) : super(key: key);

  @override
  GridButtonState createState() => GridButtonState();
}

class GridButtonState extends State<GridButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var color = !isClicked ? MyColors.light : MyColors.dark;

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTapDown: this.onTapDown,
        onTapUp: this.onTapUp,
        onTapCancel: this.onTapCancel,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 5),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.2,
              color: MyColors.dark,
            ),
            color: color,
          ),
          child: Center(
            child: Text(
              "${widget.columnIndex + 1}",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  color: !isClicked ? MyColors.dark : MyColors.light),
            ),
          ),
        ),
      ),
    );
  }

  void onTapDown(details) {

    FlutterMidi.playMidiNote(midi: widget.note);
    
    setState(() {
      isClicked = true;
    });
  }

  void onTapUp(details) {

    FlutterMidi.stopMidiNote(midi: widget.note);

    setState(() {
      isClicked = false;
    });
  }

  void onTapCancel() {

    FlutterMidi.stopMidiNote(midi: widget.note);

    setState(() {
      isClicked = false;
    });
  }
}