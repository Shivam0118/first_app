import 'package:flutter/material.dart';

void main() {
  var offset;

  runApp(MaterialApp(
      home: Scaffold(
          body: SafeArea(
    child: Container(
      color: Colors.white12,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ...getMyWidget(),
        Container(
          child: SizedBox(
            height: 20,
          ),
        ),
        Container(
          height: 20,
          color: Colors.black,
        )
        /*Container(
                              width: 40,
                              height: 40,
                              color: Colors.blueAccent,
                              child: Center(child: Text("1")),
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                color: Colors.redAccent,
                                child: Center(child: Text("2"))),
                            Container(
                                width: 40,
                                height: 40,
                                color: Colors.greenAccent,
                                child: Center(child: Text("3")))
                          */
      ]),
    ),
  ))));
}

//Android materialapp
//ios cupurtino theme
List<Widget> getMyWidget() {
  List<Color> myContainerColor = [
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.pink,
    Colors.indigo,
    Colors.red,
    Colors.purple
  ];
  List<Widget> myResult = [];

  for (var i = 0; i < myContainerColor.length; i++) {
    myResult.add(Container(
      color: myContainerColor[i].withAlpha(100),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            color: myContainerColor[i],
            child: Center(child: Text("${i + 1}")),
          ),
        ],
      ),
    ));
  }
  return myResult;
}
