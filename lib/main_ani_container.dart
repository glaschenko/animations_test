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
          body: ContainerAnimation(),
        )
    );
  }
}

class ContainerAnimation extends StatefulWidget {
  @override
  _ContainerAnimationState createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  bool _firstState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
          child: AnimatedContainer(
            child: Image.asset("assets/ava1.jpg", fit: BoxFit.fill),
            height: _firstState ? 400 : 200,
            width: _firstState ? 400 : 200,
            color: _firstState ? Colors.amber : Colors.green,
            duration: const Duration(milliseconds: 1000),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            _firstState = !_firstState; 
          });
        },
      ),
    );
  }
}


