//import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Screen1(), routes: {
    "/": (context) => Screen1(),
    "/Screen2": (context) => Screen2(),
    "/Screen3": (context) => Screen3(),
  }));
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                InkWell(
                    onTap: () {
                      print("On Screen 1");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Screen2() as Widget)));
                    },
                    child: Container(
                      child: Text("button 1"),
                    ))
              ])),
        ));
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Screen3())));
            },
            child: Container(
              child: Text("button 2"),
            ),
          ),
        )));
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Container(
              child: Text("button 3"),
            ),
          ),
        )));
  }
}
