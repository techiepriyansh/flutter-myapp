import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/grid_size.dart';
import 'package:myapp/grid_state.dart';
import 'package:myapp/grid_button.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridSize = GridSize.size;
    final buttons = List.generate(
        gridSize,
        (columnIndex) => List.generate(
            gridSize, (rowIndex) {

              //find out which degree this button is
              int pos = rowIndex * gridSize + columnIndex;
              int middle = gridSize * ((gridSize + 1)/2).floor();
              if (pos < middle) pos -= 1;
              int degree = pos - middle + 1;

              int note = Provider.of<GridState>(context).musicalKey.getNoteAt(degree);

              return GridButton(columnIndex, rowIndex, note); 
            
            }));

    final buttonGrid = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map(
            (buttonColumn) => Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttonColumn,
              ),
            ),
          )
          .toList(),
    );

    return buttonGrid;
  }
}
