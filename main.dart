import 'package:flutter/material.dart';

import 'package:myapp/grid.dart';
import 'package:myapp/grid_size.dart';
import 'package:myapp/my_colors.dart';
import 'package:myapp/grid_state.dart';

import 'package/frequencies.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => GridState(gridSize: GridSize.size),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Grid(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: MyColors.light.withOpacity(0.2),
                      child: Center(
                        child: Text(
                          "TAP MUSIC",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w100,
                            color: MyColors.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
