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
          body: CurvesAnimation(),
        )
    );
  }
}

class CurvesAnimation extends StatefulWidget {
  @override
  _CurvesAnimationState createState() => _CurvesAnimationState();
}

class _CurvesAnimationState extends State<CurvesAnimation> {
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
          child: Stack(
            children: [
              AnimatedPositioned(
                  child: Image.asset("assets/ava2.png", height: 200, width: 200),
                  duration: const Duration(seconds: 2),
                  curve: Curves.slowMiddle,
                  left: _left,
                  top: _left == 0 ? 0 : 100
              )
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            _left = _left > 0 ? 0 : size.width - 200;
          });
        },
      ),
    );
  }
}


