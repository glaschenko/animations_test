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
          body: OpacityAnimation(),
        )
    );
  }
}

class OpacityAnimation extends StatefulWidget {
  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  bool _transparent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _transparent ? 0 : 1,
          duration: const Duration(seconds: 1),
          child: FlutterIcon(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            _transparent = !_transparent;
          });
        },
      ),
    );
  }
}


