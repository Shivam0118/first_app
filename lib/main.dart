import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool myThemeDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (myThemeDark) ? ThemeData.dark() : ThemeData(),
      home: Screen_1(
        sourceButton: 1,
        changeThemeToDark: changeMyAppTheme,
      ),
    );
  }

  void changeMyAppTheme(bool changeToBlack) {
    setState(() {
      myThemeDark = changeToBlack;
    });
  }
}

class Screen_2 extends StatefulWidget {
  final Color color;
  final Function(bool) changeThemeToDark;
  const Screen_2(
      {super.key, required this.color, required this.changeThemeToDark});

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
  Color? myColor;
  bool myValue = false;

  @override
  void initState() {
    myColor = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Switch(
                value: myValue,
                onChanged: (value) {
                  setState(() {
                    myValue = value;
                  });
                  widget.changeThemeToDark(value);
                }),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hello world!',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            InkWell(
              onTap: () {
                print("On Screen 1");
                Navigator.pop(context);
              },
              child: Container(
                child: Text("Go to screen 1"),
              ),
            ),
          ],
        ),
      ],
    ))));
  }

  void changeBackground(Color color) {
    myColor = color;
    print(color);
    print("Reached here");
    setState(() {});
  }
}

class Screen_1 extends StatelessWidget {
  final int sourceButton;

  final Function(bool) changeThemeToDark;

  const Screen_1(
      {super.key, required this.sourceButton, required this.changeThemeToDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Screen_2(
                    color: Colors.green,
                    changeThemeToDark: changeThemeToDark))));
      },
      child: Container(
        child: Text("Go to screen 2"),
      ),
    ))));
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Center(
                child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Text("Screen 3"),
          ),
        ))));
  }
}
