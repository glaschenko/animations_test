import 'package:flutter/material.dart';

import 'flutter_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Implicit Animations',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: CrossFadeAnimation(),
        )
    );
  }
}

class CrossFadeAnimation extends StatefulWidget {
  @override
  _CrossFadeAnimationState createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Image.asset("assets/ava2.png", height: 300, width: 300),
          secondChild: Image.asset("assets/ava1.jpg", height: 300, width: 300),
          crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 10000),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            _first = !_first;
          });
        },
      ),
    );
  }
}


