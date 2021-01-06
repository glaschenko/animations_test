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
          body: TweenAniBuilder(),
        )
    );
  }
}

class TweenAniBuilder extends StatefulWidget {
  @override
  _TweenAniBuilderState createState() => _TweenAniBuilderState();
}

class _TweenAniBuilderState extends State<TweenAniBuilder> {
  bool _transparent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: TweenAnimationBuilder<Color>(
          tween: ColorTween(begin: Colors.green, end: Colors.red),
          duration: const Duration(seconds: 5),
          builder: (_, Color value, __) {
            return FlutterIcon(color: value);
          },
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


