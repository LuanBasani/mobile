// aplicativo de introdução ao uso de Widgets de Layout (Columns, Rows, Stacks, Containers)

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets de Layouts"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.lightBlue,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.circle_outlined),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.circle_outlined)
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.greenAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.star)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.lightBlue,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.star),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.star)
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.greenAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.star)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.lightBlue,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                    ),
                    Icon(Icons.star),
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.circle_outlined)
                  ],
                ),
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      color: Colors.greenAccent,
                      width: 115,
                      height: 115,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                    ),
                    Icon(Icons.circle_outlined)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
