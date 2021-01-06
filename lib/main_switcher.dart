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
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
          child: AnimatedSwitcher(
            child: Text(
              '$_count',
              // This key causes the AnimatedSwitcher to interpret this as a "new"
              // child each time the count changes, so that it will begin its animation
              // when the count changes.
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, animation) {
              return ScaleTransition(child: child, scale: animation);
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}


